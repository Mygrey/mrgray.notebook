use traffic;

insert overwrite table t_kckp_score

union all 
select
sfzh,
(sum(qbzr)*20+sum(zyzr)*15+sum(tdzr)*10+sum(cyzr)*5)*0.7 as score 
from (
select
b.drivinglicense as sfzh
b.driverinfoid,
a.driver1infoid,
case when a.driver1responsibility like '%全部责任%' then 1 else 0 end  as qbzr,
case when a.driver1responsibility like '%主要责任%' then 1 else 0 end  as zyzr,
case when a.driver1responsibility like '%同等责任%' then 1 else 0 end  as tdzr,
case when a.driver1responsibility like '%次要责任%' then 1 else 0 end  as cyzr
from (select driver1infoid,driver1responsibility from  kukp_accidentinfo where
datediff(current_date,substring(accidenttime,1,10)) > 365 and datediff(current_date,substring(accidenttime,1,10)) <= 730)a
inner join kukp_driverinfo  b 
on a.driver1infoid=b.driverinfoid) c group by sfzh
union all
select
sfzh,
(sum(qbzr)*20+sum(zyzr)*15+sum(tdzr)*10+sum(cyzr)*5)*0.7 as score 
from (
select
e.drivinglicense as sfzh
e.driverinfoid,
d.driver2infoid,
case when d.driver2responsibility like '%全部责任%' then 1 else 0 end  as qbzr,
case when d.driver2responsibility like '%主要责任%' then 1 else 0 end  as zyzr,
case when d.driver2responsibility like '%同等责任%' then 1 else 0 end  as tdzr,
case when d.driver2responsibility like '%次要责任%' then 1 else 0 end  as cyzr
from (select driver2infoid,driver2responsibility from  kukp_accidentinfo where
datediff(current_date,substring(accidenttime,1,10)) > 365 and datediff(current_date,substring(accidenttime,1,10)) <= 730 )d
inner join kukp_driverinfo  e 
on a.driver2infoid=b.driverinfoid) f group by sfzh
union all 
select
sfzh,
(sum(qbzr)*20+sum(zyzr)*15+sum(tdzr)*10+sum(cyzr)*5)*0.4 as score 
from (
select
b.drivinglicense as sfzh
b.driverinfoid,
a.driver1infoid,
case when a.driver1responsibility like '%全部责任%' then 1 else 0 end  as qbzr,
case when a.driver1responsibility like '%主要责任%' then 1 else 0 end  as zyzr,
case when a.driver1responsibility like '%同等责任%' then 1 else 0 end  as tdzr,
case when a.driver1responsibility like '%次要责任%' then 1 else 0 end  as cyzr
from (select driver1infoid,driver1responsibility from  kukp_accidentinfo where
datediff(current_date,substring(accidenttime,1,10)) > 730 and datediff(current_date,substring(accidenttime,1,10)) <= 1095)a
inner join kukp_driverinfo  b 
on a.driver1infoid=b.driverinfoid) c group by sfzh
union all
select
sfzh,
(sum(qbzr)*20+sum(zyzr)*15+sum(tdzr)*10+sum(cyzr)*5)*0.4 as score 
from (
select
e.drivinglicense as sfzh
e.driverinfoid,
d.driver2infoid,
case when d.driver2responsibility like '%全部责任%' then 1 else 0 end  as qbzr,
case when d.driver2responsibility like '%主要责任%' then 1 else 0 end  as zyzr,
case when d.driver2responsibility like '%同等责任%' then 1 else 0 end  as tdzr,
case when d.driver2responsibility like '%次要责任%' then 1 else 0 end  as cyzr
from (select driver2infoid,driver2responsibility from  kukp_accidentinfo where
datediff(current_date,substring(accidenttime,1,10)) > 730 and datediff(current_date,substring(accidenttime,1,10)) <= 1095 )d
inner join kukp_driverinfo  e 
on a.driver2infoid=b.driverinfoid) f group by sfzh