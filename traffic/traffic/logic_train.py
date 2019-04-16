#!/usr/bin/env python
# -*- coding: utf-8 -*-

import MySQLdb as mdb
import pandas as pd
from sklearn.linear_model import LogisticRegression 
import numpy as np
np.set_printoptions(suppress=True)

def round_function(x):
    return round(x,5)


#conn = mdb.connect(host='10.1.80.6', port=3306, user='root', passwd='bigDataTeam', db='traffic', charset='utf8')

config = {
    'host': '10.1.80.6',
    'port': 3306,
    'user': 'root',
    'passwd': 'bigDataTeam',
    'db': 'traffic',
    'charset': 'utf8'
}
conn = mdb.connect(**config)
cursor = conn.cursor()
cursor.execute("set SQL_BIG_SELECTS=1")
cursor.execute("select * from zc_driver_train")
matrix_data=cursor.fetchall()
matrix_list=[]

for row in matrix_data:
    temp=list(row)
    matrix_list.append(temp)

df=pd.DataFrame(matrix_list)

label=df.iloc[:,[33]]
train_date=df.iloc[:,1:32]

comput = df.iloc[:,1:2].apply(lambda x: x.sum())
myclassfier=LogisticRegression(max_iter=500)
logic_model=myclassfier.fit(train_date,label)
f_param=logic_model.coef_
result=map(round_function,f_param[0])
result_str=str(tuple(result))

cursor.execute("truncate table zc_logic_result")
sql_str="""insert into zc_logic_result (jl,zt,ryzt,max_wfxw,level1_count,level2_count,level3_count,wfxw_count,max_wfjfs,avg_wfjfs,wfjfs_count,max_fkje,avg_fkje,fkje_count,max_znj,avg_znj,znj_count,qzcs,cqts,sfty,qbzr,zyzr,tdzr,cyzr,myzr,wfrd,swrs,szrs,zsrs,qsrs,zjccss) values %s """ % result_str

print sql_str
cursor.execute("truncate table zc_logic_result")
cursor.execute(sql_str)
conn.commit()
cursor.close()
conn.close()
