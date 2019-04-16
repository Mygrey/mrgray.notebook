truncate table zc_level_result;
SET SQL_BIG_SELECTS=1;

INSERT INTO zc_level_result
SELECT
c.sfzh,
c.score as score,
case
when rowNo<= d.num*0.3 then 1
when rowNo>d.num*0.3 and rowNo<=d.num*0.6 then 2
when rowNo>d.num*0.6 and rowNo<=d.num*0.9 then 3
when rowNo>d.num*0.9 and rowNo<=d.num*0.95 then 4
else 5 end level
FROM
(select sfzh,score,(@rowNum:=@rowNum+1) as rowNo 
from zc_score_result, 
(select (@rowNum :=0) ) b 
order by zc_score_result.score desc) c
LEFT JOIN
(select count(0) as num,max(score) as maxs,min(score) as mins from zc_score_result)d
on 1=1
;
