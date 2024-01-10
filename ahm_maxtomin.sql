-- mtm gets anyarray input and result anyarray output.
-- Result send an array with two dimension which include min and max values of input values of function.
-- we use least and greatest codes because we need to returns the largest/lowest value from the specified values of array
CREATE OR REPLACE FUNCTION mtm (anyarray,anyelement )
RETURNS anyarray LANGUAGE sql IMMUTABLE AS $$
        SELECT CASE
            WHEN $1 IS NULL THEN ARRAY[$2] 
            WHEN $1[1] IS NULL THEN $1
            WHEN $2 IS NULL THEN ARRAY[$2]  
            ELSE ARRAY[ARRAY[greatest($1[1],$2)],ARRAY[least($1[1],$2)]]  END ;
$$;


-- To show output of aggregate as text line with values we use mtmfin function. 
-- IF there is no input, result is empty (output can be error notes)
-- if there are not more than 2 values in inputs, it show Error

CREATE OR REPLACE FUNCTION mtmfin (anyarray)
RETURNS text LANGUAGE sql IMMUTABLE AS $$
        SELECT CASE 
            when $1 is null then NULL
            when array_length($1,1) < 2 then 'need more than one value!' 
            else  $1[1][1]::text || ' -> ' || $1[2][1]::text  END ;
$$;


-- max_to_min aggregate use mtm function to find min and max values of input values. 
-- To output, it use mtmfin function and output result string as "max(value) -> min(value)".
CREATE AGGREGATE max_to_min (anyelement) (
        sfunc     = mtm,
        stype     = anyarray,
        finalfunc = mtmfin
);
