# maxtomin
Ahmet Melih Basbug's question 1 solution

Step 1 Building and installing maxtomin

You will need postgresql development packages to build maxtomin before make install command

```
sudo make install
```

Step 2 Creating extensions

```
postgres=# CREATE EXTENSION maxtomin;
```

Step 3 Update to new version
```
postgres=# ALTER EXTENSION maxtomin UPDATE;
```

Step 4 Testing

> [!TIP]
> SELECT max_to_min(val) FROM (VALUES(5),(3),(6),(7),(9),(10),(7)) t(val);

> [!TIP]
> create table t (val int);
> 
> insert into t select val from (VALUES(5),(3),(6),(7),(9),(10),(7)) t(val);
> 
> SELECT max_to_min(val) FROM t;

> [!NOTE]
>  when this aggregate function gets less than 2 values it gives error as "need more than one value!"
