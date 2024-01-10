
CREATE OR REPLACE FUNCTION smas (anyarray,anyelement )
RETURNS anyarray LANGUAGE sql IMMUTABLE AS $$
        SELECT CASE
            WHEN $1 IS NULL THEN ARRAY[$2] 
            WHEN $1[1] IS NULL THEN $1
            WHEN $2 IS NULL THEN ARRAY[$2]  
            ELSE ARRAY[ARRAY[greatest($1[1],$2)],ARRAY[least($1[1],$2)]]  END ;
$$;

CREATE OR REPLACE FUNCTION saf (anyarray)
RETURNS text LANGUAGE sql IMMUTABLE AS $$
        SELECT CASE 
            when $1 is null then NULL
            when array_length($1,1) < 2 then 'need more than one value!' 
            else  $1[1][1]::text || ' -> ' || $1[2][1]::text  END ;
$$;

CREATE AGGREGATE max_to_min (anyelement) (
        sfunc     = smas,
        stype     = anyarray,
        finalfunc = saf
);
