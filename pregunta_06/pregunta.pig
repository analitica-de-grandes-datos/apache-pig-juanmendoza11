/*
Pregunta
===========================================================================

Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
columna 3. En otras palabras, cuántos registros hay que tengan la clave 
`aaa`?

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

datos = LOAD 'data.tsv' AS (letra:chararray, bagArray:chararray, mapa:map [] );
fetch_1 = FOREACH datos GENERATE mapa;
fetch_2 = FOREACH fetch_1 GENERATE FLATTEN(mapa);  
agrupar = GROUP fetch_2 BY $0;
conteo = FOREACH agrupar GENERATE group, COUNT($1);

STORE conteo INTO 'output/' using PigStorage(',');