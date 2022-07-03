/*
Pregunta
===========================================================================

Obtenga los cinco (5) valores más pequeños de la 3ra columna.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

datos = LOAD 'data.tsv' AS (letra:chararray, fecha:chararray, valor:int);
ordenar = ORDER datos BY valor;
top = limit ordenar 5;
fetch = FOREACH top GENERATE valor;

STORE fetch INTO 'output/' using PigStorage(',');