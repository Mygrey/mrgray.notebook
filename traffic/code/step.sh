sqoop import --connect jdbc:mysql://10.1.40.104:3306/test?characterEncoding=utf-8 --username root --password root --query 'select jszh,zjcx,syxz,wfsj,wfxw,wfjfs,fkje,znj,pzbh,jsjqbj,sgdj,nl,xb from v_jg_vio_violation where $CONDITIONS'  --num-mappers 1 --target-dir /home/hdfs/data/traffic/v_jg_vio_violation --delete-target-dir --fields-terminated-by ','


sqoop import --connect jdbc:mysql://10.1.40.104:3306/test?characterEncoding=utf-8 --username root --password root --query 'select SFZMHM,CCLZRQ,LJJF,BZCS,ZT,RYZT,SXBJ from v_jg_drivinglicense where $CONDITIONS'  --num-mappers 1 --target-dir /home/hdfs/data/traffic/v_jg_drivinglicense --delete-target-dir --fields-terminated-by ','


sqoop import --connect jdbc:mysql://10.1.40.104:3306/test?characterEncoding=utf-8 --username root --password root --query 'select code,jb from v_jg_wf_info where $CONDITIONS'  --num-mappers 1 --target-dir /home/hdfs/data/traffic/v_jg_wf_info --delete-target-dir --fields-terminated-by ','


sqoop import --connect jdbc:mysql://10.1.40.104:3306/test?characterEncoding=utf-8 --username root --password root --query 'select SGBH,SGFSSJ,SWRS30,SZRS,ZSRS,QSRS,ZJCCSS,SFTY from v_jg_acd_file where $CONDITIONS'  --num-mappers 1 --target-dir /home/hdfs/data/traffic/v_jg_acd_file --delete-target-dir --fields-terminated-by ','

sqoop import --connect jdbc:mysql://10.1.40.104:3306/test?characterEncoding=utf-8 --username root --password root --query 'select SGBH,SFDSR,SFZMHM,SFTY,SWSJ,SGZR,XYJJHL,SFCZ from v_jg_acd_filehuman where $CONDITIONS'  --num-mappers 1 --target-dir /home/hdfs/data/traffic/v_jg_acd_filehuman --delete-target-dir --fields-terminated-by ','


sqoop export --connect jdbc:mysql://10.1.80.6:3306/traffic?characterEncoding=utf-8 --username root --password bigDataTeam --table zc_driver_train --input-fields-terminated-by ","  --export-dir /home/hdfs/data/traffic/zc_driver_train


sqoop export --connect jdbc:mysql://10.1.80.6:3306/traffic?characterEncoding=utf-8 --username root --password bigDataTeam --table zc_driver_matrix --input-fields-terminated-by ","  --export-dir /home/hdfs/data/traffic/zc_driver_matrix

sqoop export --connect jdbc:mysql://10.1.80.6:3306/traffic?characterEncoding=utf-8 --username root --password bigDataTeam --table zc_feature_woe --input-fields-terminated-by ","  --export-dir /home/hdfs/data/traffic/zc_feature_woe


sqoop import --connect jdbc:mysql://10.1.80.6:3306/traffic?characterEncoding=utf-8 --username root --password bigDataTeam --query 'select sfzhm,jf,jb from t_elec_credit_info where $CONDITIONS'  --num-mappers 1 --target-dir /home/hdfs/data/traffic/t_elec_credit_info --delete-target-dir --fields-terminated-by ','

sqoop export --connect jdbc:mysql://10.1.80.6:3306/traffic?characterEncoding=utf-8 --username root --password bigDataTeam --table zc_black_table --input-fields-terminated-by ","  --export-dir /home/hdfs/data/traffic/zc_black_table

sqoop export --connect jdbc:mysql://10.1.80.6:3306/traffic?characterEncoding=utf-8 --username root --password bigDataTeam --table t_score_info --input-fields-terminated-by ","  --export-dir /home/hdfs/data/traffic/t_score_info


 sqoop export --connect jdbc:mysql://172.16.25.4:3306/test?characterEncoding=utf-8 --username root --password 123456 --table t_elec_credit_info --update-key "id" --update-mode allowinsert  --input-fields-terminated-by ","  --export-dir /home/hdfs/data/traffic/t_elec_credit_info

管局环境hive到MySQL：
sqoop export --connect jdbc:mysql://172.16.25.18:3306/zc_elec?characterEncoding=utf-8 --username zcelec --password zcelec --table t_elec_credit_info --update-key "id" --update-mode allowinsert  --input-fields-terminated-by ","  --export-dir /home/hdfs/data/traffic/t_elec_credit_info