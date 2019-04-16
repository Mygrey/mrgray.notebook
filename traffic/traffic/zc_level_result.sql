truncate table zc_level_result;
SET SQL_BIG_SELECTS=1;

INSERT INTO zc_level_result
SELECT
c.sfzh,
round(c.score,2) as score,
case 
when c.score>=a.maxs then 1
when c.score<a.mins then 5
when c.score>=a.mins and c.score< a.mins+a.td*0.4 then 4
when c.score>=a.mins+a.td*0.4 and c.score< a.mins+a.td*0.8 then 3
when c.score<a.maxs and c.score>=a.maxs-a.td*0.2 then 2
else 0 end level 
FROM
zc_score_result c
LEFT JOIN
(select maxs*50 as maxs,mins*100 as mins,maxs*50-mins*100 as td from (select floor(max(score)/50.0) as maxs,ceil(min(score)/100.0) as mins  from zc_score_result) d ) a
 on 1=1
;
