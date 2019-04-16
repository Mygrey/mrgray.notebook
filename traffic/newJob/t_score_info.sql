use traffic;

insert overwrite table t_score_info
SELECT
sfzh,
if(last_month<0,0,last_month) as last_month,
acd_one,
acd_two,
acd_three,
vio_score,
acd_add,
black_mark,
black_mark*(500+if(last_month<0,0,last_month)*3-acd_one-acd_two*0.7-acd_three*0.4+acd_add-vio_score) as score
FROM(
SELECT
g.sfzh,
if(g.lzsc>=36,36,g.lzsc)-g.last_month as last_month,
g.acd_one,
g.acd_two,
g.acd_three,
g.vio_score,
if(g.acd_one=0 and g.lzsc>=12,20,0)+if(g.acd_two=0 and g.lzsc>=24,30,0)+if(g.acd_three=0 and g.lzsc>=36,40,0) as acd_add,
case when h.black_mark is null then 1 else 0 end as black_mark
FROM(
SELECT
a.sfzmhm as sfzh,
least(floor(datediff(current_date,substring(a.cclzrq,1,10))/30.0),
floor(datediff(current_date,'FFBB-SS-JJ')/30.0)) as lzsc,
case when b.num is null then 0 else b.num end as last_month,
case when c.score is null then 0 else c.score end as acd_one,
case when d.score is null then 0 else d.score end as acd_two,
case when e.score is null then 0 else e.score end as acd_three,
case when f.score is null then 0 else f.score end as vio_score
FROM
(select sfzmhm,cclzrq  from v_jg_drivinglicense  where ccfzjg like '%贵A%' )a 
LEFT JOIN
(
select
jszh,
count(0) as num
from(
select 
jszh,
month_count
from(
SELECT DISTINCT
jszh,
substring(wfsj,1,7) as month_count
FROM
v_jg_vio_violation
WHERE datediff(current_date,substring(wfsj,1,10)) <= 1095
and datediff(substring(wfsj,1,10),'FFBB-SS-JJ') >= 0
) s group by jszh,month_count
) z
group by jszh
) b 
on a.sfzmhm=b.jszh
LEFT JOIN t_acd_one c 
on a.sfzmhm=c.sfzh
LEFT JOIN t_acd_two d 
on a.sfzmhm=d.sfzh
LEFT JOIN t_acd_three e
on a.sfzmhm=e.sfzh
LEFT JOIN t_vio_info f
on a.sfzmhm=f.sfzh
)g
left join zc_black_table h 
on g.sfzh=h.sfzh
)j;