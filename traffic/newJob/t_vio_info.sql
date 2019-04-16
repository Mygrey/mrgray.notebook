use traffic;

insert overwrite table t_vio_info
SELECT jszh,
floor(sum(score)) as score,
sum(level1_count),
sum(level2_count),
sum(level3_count)
FROM(
SELECT
jszh,
(10*level1_count+20*level2_count+40*level3_count)*1.0 as score,
level1_count,
level2_count,
level3_count
FROM(
SELECT
jszh,
count(case when jb=1 then 1 else null end) as level1_count,
count(case when jb=2 then 1 else null end) as level2_count,
count(case when jb=3 then 1 else null end) as level3_count
FROM(
SELECT
a.jszh,
a.wfxw,
cast(if(b.level is NULL,1,b.level) as int) as jb
FROM(
SELECT
jszh,
wfxw
FROM
v_jg_vio_violation
WHERE datediff(current_date,substring(wfsj,1,10)) <= 365
and datediff(substring(wfsj,1,10),'FFBB-SS-JJ') >=0
) a
LEFT JOIN v_jg_wf_info b
ON a.wfxw=b.code
) c  group by jszh
)f
union all
SELECT
jszh,
(10*level1_count+20*level2_count+40*level3_count)*0.7 as score,
level1_count,
level2_count,
level3_count
FROM(
SELECT
jszh,
count(case when jb=1 then 1 else null end) as level1_count,
count(case when jb=2 then 1 else null end) as level2_count,
count(case when jb=3 then 1 else null end) as level3_count
FROM(
SELECT
a.jszh,
a.wfxw,
cast(if(b.level is NULL,1,b.level) as int) as jb
FROM(
SELECT
jszh,
wfxw
FROM
v_jg_vio_violation
WHERE datediff(current_date,substring(wfsj,1,10)) > 365 and datediff(current_date,substring(wfsj,1,10)) <= 730
and datediff(substring(wfsj,1,10),'FFBB-SS-JJ') >=0
) a
LEFT JOIN v_jg_wf_info b
ON a.wfxw=b.code
) c  group by jszh
) g
union all
SELECT
jszh,
(10*level1_count+20*level2_count+40*level3_count)*0.4 as score,
level1_count,
level2_count,
level3_count
FROM(
SELECT
jszh,
count(case when jb=1 then 1 else null end) as level1_count,
count(case when jb=2 then 1 else null end) as level2_count,
count(case when jb=3 then 1 else null end) as level3_count
FROM(
SELECT
a.jszh,
a.wfxw,
cast(if(b.level is NULL,1,b.level) as int) as jb
FROM(
SELECT
jszh,
wfxw
FROM
v_jg_vio_violation
WHERE datediff(current_date,substring(wfsj,1,10)) >730 and datediff(current_date,substring(wfsj,1,10)) <= 1095
and datediff(substring(wfsj,1,10),'FFBB-SS-JJ') >=0
) a
LEFT JOIN v_jg_wf_info b
ON a.wfxw=b.code
) c  group by jszh
) h
) j group by jszh;