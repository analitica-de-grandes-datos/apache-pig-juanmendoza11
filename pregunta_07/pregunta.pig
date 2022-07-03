/*
Pregunta
===========================================================================

Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
columna 3 separados por coma. La tabla debe estar ordenada por las 
columnas 1, 2 y 3.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

datos = LOAD 'data.tsv' USING PigStorage('\t') AS (c1:charArray, c2:BAG{t: TUPLE(p:charArray)}, c3:MAP[]);
interar = FOREACH datos GENERATE c1, COUNT(c2) AS c2, SIZE(c3) AS c3;
ordenar = ORDER interar BY c1, c2, c3;

STORE ordenar INTO 'output' USING PigStorage(',');