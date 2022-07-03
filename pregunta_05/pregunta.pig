/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
aparece cada letra minúscula en la columna 2.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

datos = LOAD 'data.tsv' AS (letra:CHARARRAY, minusculas:BAG{dict:TUPLE(letter:CHARARRAY)}, lista:CHARARRAY);
fetch = FOREACH datos GENERATE minusculas;
letras = FOREACH fetch GENERATE FLATTEN(minusculas) AS word;
agrupar = GROUP words BY word;
cuenta = FOREACH agrupar GENERATE group, COUNT (words);

STORE cuenta INTO 'output' USING PigStorage(',');