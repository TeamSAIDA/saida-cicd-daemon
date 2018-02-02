import pymysql
import config
import json

"""
This is a single instance to aceess MySQL instanec in this dameon.
API guide : http://pymysql.readthedocs.io/en/latest/

"""

botnames = {}

class MySQL(object) :
    _db_connection = None
    _db_curr = None

    def __init__(self):
        _host = config.DATABASE_CONFIG['host']
        _user = config.DATABASE_CONFIG['user']
        _password = config.DATABASE_CONFIG['password']
        _database_name = config.DATABASE_CONFIG ['database-name']
        _charset = config.DATABASE_CONFIG['charset']

        # get a connection
        self._db_connection =  conn = pymysql.connect(host=_host, user=_user, password=_password, db=_database_name, charset=_charset )
        # get a cursor
        self._db_curr = conn.cursor()

    def __del__(self):
        self._db_connection.close()

    def execue_not_select_sql(self, query, params=None, is_multi_row=False) :
        self._db_curr.execute('set profiling = 1')
        try:
            print("Executing query : {}".format(query))
            if params is None :
                print("Executing param : {}".format(params))
                self._db_curr.execute(query)
            elif is_multi_row :
                for param in params :
                    print("Executing param : {}".format(param))
                    self._db_curr.execute(query, param)
            else :
                self._db_curr.execute(query, params)
            self._db_connection.commit()
            print('mysql commit success')
        except Exception:
            print('mysql query gets error and failed. see the error below.')
            self._db_curr.execute('show profiles')
            for row in self._db_curr:
                print(row)
        self._db_curr.execute('set profiling = 0')

    def execute_select_query(self, query, params=None):

        self._db_curr.execute('set profiling = 1')
        try:
            print("Executing query : {}".format(query))
            if params is None :
                self._db_curr.execute(query)
            else :
                print("Executing param : {}".format(params))
                self._db_curr.execute(query, params)

            print('mysql select success')
        except Exception:
            print('mysql query gets error and failed. see the error below.')
            self._db_curr.execute('show profiles')
            for row in self._db_curr:
                print(row)

        columns = self._db_curr.description
        result = [{columns[index][0]:column for index, column in enumerate(value)} for value in self._db_curr.fetchall()]

        return result;

def insert_query_with_multi_dict(table_name, rows) :
    if isinstance(rows, list) and rows :
        mysql = MySQL()

        param_dict = rows[0]

        placeholders = ', '.join(['%s'] * len(param_dict))
        columns = ', '.join(param_dict.keys())

        qry = "Insert Into {0} ({1}) Values ({2})".format(table_name, columns, placeholders)

        params = [[item for item in param_dict.values() ] for param_dict in rows]

        mysql.execue_not_select_sql(qry, params, True)

def insert_query_with_dict(table_name, param_dict) :
    mysql = MySQL()

    placeholders = ', '.join(['%s'] * len(param_dict))
    columns = ', '.join(param_dict.keys())

    qry = "Insert Into {0} ({1}) Values ({2})".format(table_name, columns, placeholders)
    print('qry : ', qry)

    l = []
    for item in param_dict.values() :
        l.append(item)

    mysql.execue_sql(qry, l)

def generate_map() :
    json_string_of_bot = "{\"id\" : 18 ,\"bot_name\" : \"joe\" ,\"api_version\" : 1,\"owner\" : \"joe\" ,\"type\" : \"1\", \"race_type\" : \"T\"} "
    json_string_of_game = "{\"id\" : 5 ,\"bot_id\" : 1, \"id_bot_1\" : 1, \"id_bot_2\" : 5, \"win_count\" : 1 , \"loss_count\" : 1, \"draw_count\" : 1, \"race_type_of_bot1\" : \"T\", \"race_type_of_bot2\" :\"T\"} "

    return json.loads(json_string_of_bot), json.loads(json_string_of_game)

def insert_data() :
    db = MySQL();
    bot, game = generate_map()

    import time
    now = time.strftime('%Y-%m-%d %H:%M:%S')

    bot['create_dt'] = now
    bot['update_dt'] = now

    game['create_dt'] = now
    game['update_dt'] = now

    insert_query_with_dict('bot', bot)
    insert_query_with_dict('game', game)

def insert_query_with_sql() :

     db = MySQL();
     sql =  "INSERT INTO `bot`(`id`, `bot_name`, `api_version`, `owner`, `type`, `race_type`) VALUES(5, 'joe', 1, 'joe', 1, 'T')"
     db.execue_not_select_sql(sql)

def getBotIdFromBotName(bot_name) :
    print(botnames)
    if bot_name not in botnames :
        db = MySQL();

        sql = 'select bot_name, bot_id from bot where bot_name = %s'

        row = db.execute_select_query(sql, bot_name)[0]

        print(row)

        botnames[row['bot_name']] = row['bot_id']
        print(botnames)
    return botnames[bot_name]

def select_bot_with_yyyymmdd(yyyymmdd) :
    db = MySQL();
    sql = "select * from game where date(create_dt) =%s"
    rows = db.execute_select_query(sql, yyyymmdd);  # run a sql
    return rows


def select_game_with_yyyymmdd(yyyymmdd) :
    db = MySQL();
    sql = 'select a.*,  b.*, c.* from game a, bot b, bot c where a.bot_id_1 = b.bot_id and a.bot_id_2 = c.bot_id and date(a.create_dt) = %s';
    rows = db.execute_select_query(sql, yyyymmdd);  # run a sql
    
    return rows

if __name__ == '__main__':
    # insert_query_with_sql()
    insert_data()



