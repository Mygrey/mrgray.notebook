truncate table zc_level_result;
SET SQL_BIG_SELECTS=1

INSERT INTO zc_level_result
SELECT
c.sfzh,
round(c.score,4) as score,
case
when rowNo<= d.num*0.2 then 1
when rowNo>d.num*0.2 and rowNo<=d.num*0.6 then 2
when rowNo>d.num*0.6 and rowNo<=d.num*0.8 then 3
when rowNo>d.num*0.8 and rowNo<=d.num*0.9 then 4
else 5 end level
FROM
(select sfzh,score,(@rowNum:=@rowNum+1) as rowNo 
from zc_score_result, 
(select (@rowNum :=0) ) b 
order by zc_score_result.score desc) c
LEFT JOIN
(select count(0) as num from zc_score_result)d
on 1=1
;