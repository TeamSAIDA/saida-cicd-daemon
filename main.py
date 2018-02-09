"""
Reference : https://blog.miguelgrinberg.com/post/designing-a-restful-api-with-python-and-flask
"""
from flask import Flask, jsonify, request
from flask_restful import reqparse, abort, Resource, Api
from api.MyDB import MySQL
import api.MyDB as mydb
import time
import calcstat

parser = reqparse.RequestParser()
app = Flask(__name__)
api = Api(app)
# db = MySQL();

@app.route('/')
def index():
    return 'Hello, Saida data framework server!'

# @app.route('/board/<int:yyyymmdd>', methods=['GET'])
# def get_tasks(yyyymmdd):
#
#     # run a sql
#     sql = "select * from game where update_dt  = %s"
#     rows = db.query(sql);
#
#     #print(rows[0])
#
#     return jsonify({'data': rows})

class Board(Resource) :

    def get(self):
        return {'hello': 'world'}

    def get(self, turn) :
        # run a sql
        print('board get api service')
        print('turn', turn)
        print(turn == 'all')
        if(turn == 'all'):
          rows = mydb.select_game_all();
        else :
          rows = mydb.select_game_with_turn(turn);
        return jsonify({'data': rows})
        
api.add_resource(Board, '/board/<turn>', endpoint='board')

class Tournament(Resource) :

    def post(self) :
        jsonBody = request.json

        bot_info = jsonBody['bot_info']
        isOldBot = mydb.getBotIdFromBotName(bot_info['bot_name'])

        if not isOldBot:
          import time
          now = time.strftime('%Y-%m-%d %H:%M:%S')
          bot_info['create_dt'] = now
          bot_info['update_dt'] = now

          mydb.insert_query_with_dict('bot', bot_info);
        
        games = jsonBody['games']

        import time
        now = time.strftime('%Y-%m-%d %H:%M:%S')

        for row in games:
            temp = {}
            temp['bot_id_1'] = mydb.getBotIdFromBotName(row.pop('my_bot_nm'))
            temp['bot_id_2'] = mydb.getBotIdFromBotName(row.pop('enemy_bot_nm'))
            temp['create_dt'] = now
            temp['update_dt'] = now
            row.update(temp)

        mydb.insert_query_with_multi_dict('game', games);

        # if len(data) is 0:
        #     conn.commit()
        #     return {'StatusCode': '200', 'Message': 'User creation success'}
        # else:
        #     return {'StatusCode': '1000', 'Message': str(data[0])}

    # def get(self, yyyymmdd) :
    #     print('tournament get api service start')
    #     print('yyyymmdd :' , yyyymmdd)
    #
    #     # run a sql
    #     sql = "select * from game where update_dt  = %s"
    #     rows = mydb.query(sql, yyyymmdd);
    #     print(rows[0])
    #
    #     return jsonify({'data': rows})

api.add_resource(Tournament, '/tournament')

class Bot(Resource) :
    def post(self):
        jsonBody = request.json
        bot_info = jsonBody['bot_info']

        import time
        now = time.strftime('%Y-%m-%d %H:%M:%S')
        bot_info['create_dt'] = now
        bot_info['update_dt'] = now

        mydb.insert_query_with_dict('bot', bot_info);

    def get(self, id=None):
        return 'hello, bot'

api.add_resource(Bot, '/bot')

class StatPerRace(Resource) :
  def get(self):
    rows = calcstat.get_winningrate_per_race()
    return jsonify(rows)

api.add_resource(StatPerRace, '/statperrace')

class StatPerTurnPerRace(Resource) :
  def get(self):
    rows = calcstat.get_winningrate_per_turn_per_race()
    return jsonify(rows)

api.add_resource(StatPerTurnPerRace, '/statperturnperrace')

if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True)