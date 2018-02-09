import numpy as np
import pandas as pd
from collections import defaultdict
import json

from api.MyDB import MySQL
import api.MyDB as mydb

def dict_from_enumerable(group, final_value, *groups):
    results = defaultdict(lambda: defaultdict(dict))
    group_count = len(groups)
    for index, value in group.itertuples():
        for i, key in enumerate(index):
            if i == 0:
                nested = results[key]
            elif i == len(index) - 1:
                nested[key] = value
            else:
                nested = nested[key]
    return results

def get_winningrate_per_race():
  names = pd.read_csv('testdata/test.csv')
  group = names.groupby(['race_cd_1', 'rslt_cd'])[['rslt_cd']].count()
  result = dict_from_enumerable(group,'rslt_cd','race_cd_1','rslt_cd')
  return result

def get_winningrate_per_turn_per_race():
  names = pd.read_csv('testdata/test.csv')
  group = names.groupby(['turn','race_cd_1', 'rslt_cd'])[['rslt_cd']].count()
  result = dict_from_enumerable(group,'rslt_cd','turn','race_cd_1','rslt_cd')
  return result