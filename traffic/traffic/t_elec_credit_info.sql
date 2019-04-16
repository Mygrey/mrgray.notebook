truncate table t_elec_credit_info;

INSERT INTO t_elec_credit_info
select
null as id,
a.sfzh,
case when b.black_mark=1 then 0 else a.score end jf,
case when b.black_mark=1 then 5 else a.level end jb
from zc_level_result a
left join zc_black_table b
on a.sfzh=b.sfzh;

