select 
jb,
count(0) as num,
round(count(0)/2259601,2) as rate,
cast(avg(level1_count) as decimal(10,5) ) as  a1,
cast(avg(level2_count) as decimal(10,5) ) as  a2,
cast(avg(level3_count) as decimal(10,5) ) as  a3,
cast(avg(wfxw_count) as decimal(10,5) ) as  a4,
cast(avg(avg_wfjfs) as decimal(10,5) ) as  a5,
cast(avg(wfjfs_count) as decimal(10,5) ) as  a6,
cast(avg(avg_fkje) as decimal(10,5) ) as  a7,
cast(avg(fkje_count) as decimal(10,5) ) as  a8,
cast(avg(avg_znj) as decimal(10,5) ) as  a9,
cast(avg(znj_count) as decimal(10,5) ) as  a10,
cast(avg(cqts) as decimal(10,5) ) as  a12,
cast(avg(qbzr) as decimal(10,5) ) as  a13,
cast(avg(zyzr) as decimal(10,5) ) as  zyzr,
cast(avg(tdzr) as decimal(10,5) ) as  tdzr,
cast(avg(cyzr) as decimal(10,5) ) as  cyzr,
cast(avg(myzr) as decimal(10,5) ) as  myzr,
cast(avg(wfrd) as decimal(10,5) ) as  wfrd,
cast(avg(zsrs) as decimal(10,5) ) as  zsrs,
cast(avg(qsrs) as decimal(10,5) ) as  qsrs,
cast(avg(zjccss) as decimal(10,5) ) as  ccss
from 
(select
a.sfzh,
a.level1_count,
a.level2_count,
a.level3_count,
a.wfxw_count,
a.avg_wfjfs,
a.wfjfs_count,
a.avg_fkje,
a.fkje_count,
a.avg_znj,
a.znj_count,
a.qzcs,
a.cqts,
a.sfty,
a.qbzr,
a.zyzr,
a.tdzr,
a.cyzr,
a.myzr,
a.wfrd,
a.swrs,
a.szrs,
a.zsrs,
a.qsrs,
a.zjccss,
case 
when b.jf>=550 then 1
when b.jf>=500 and b.jf<550 then 2
when b.jf>=450 and b.jf<500 then 3
when b.jf>=400 and b.jf<450 then 4
when b.jf>=350 and b.jf<400 then 5
when b.jf>=300 and b.jf<350 then 6
when b.jf<300 then 7
else 8 end  as jb 
from zc_driver_train a 
left join t_elec_credit_info b 
on a.sfzh=b.sfzhm) c 
group by jb;


select * from
(select
a.sfzh,
a.level1_count,
a.level2_count,
a.level3_count,
a.wfxw_count,
a.avg_wfjfs,
a.wfjfs_count,
a.avg_fkje,
a.fkje_count,
a.avg_znj,
a.znj_count,
a.qzcs,
a.cqts,
a.sfty,
a.qbzr,
a.zyzr,
a.tdzr,
a.cyzr,
a.myzr,
a.wfrd,
a.swrs,
a.szrs,
a.zsrs,
a.qsrs,
a.zjccss,
case 
when b.jf>=550 then 1
when b.jf>=500 and b.jf<550 then 2
when b.jf>=450 and b.jf<500 then 3
when b.jf>=400 and b.jf<450 then 4
when b.jf>=350 and b.jf<400 then 5
when b.jf>=300 and b.jf<350 then 6
when b.jf<300 then 7
else 8 end  as jb 
from zc_driver_train a 
left join t_elec_credit_info b 
on a.sfzh=b.sfzhm) c
where jb=1 and zsrs>0 limit 10;