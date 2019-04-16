truncate table t_level_result;

INSERT INTO t_level_result
SELECT
c.sfzh,
c.score as score,
case
when rowNo<= d.num*0.56 then 1
when rowNo>d.num*0.56 and rowNo<=d.num*0.78 then 2
when rowNo>d.num*0.78 and rowNo<=d.num*0.93 then 3
when rowNo>d.num*0.93 and rowNo<=d.num*0.98 then 4
else 5 end level
FROM
(select sfzh,score,(@rowNum:=@rowNum+1) as rowNo
from t_score_info,
(select (@rowNum :=0) ) b
order by t_score_info.score desc) c
LEFT JOIN
(select count(0) as num from t_score_info)d
on 1=1
;
