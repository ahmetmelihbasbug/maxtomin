# maxtomin
Ahmet Melih Basbug's Adjust question 1 solution (max_to_min)

Test mode 1:
SELECT max_to_min(val)
FROM (VALUES(15),(3),(6),(7),(9),(10),(7)) t(val);

Test mode 2:
create table t (val int);
insert into t select val from (VALUES(15),(3),(6),(7),(9),(10),(7)) t(val);
SELECT max_to_min(val)
FROM t;

!NOTE!: when this aggregate function gets less than 2 values it gives error as "need more than one value!"
