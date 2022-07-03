/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Cuente la cantidad de personas nacidas por año.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

datos = LOAD 'data.csv' USING PigStorage(',')
    AS (
            id:int,
            nombre:chararray,
            apellido:chararray,
            fecha:chararray,
            color:chararray,
            id2:int          
        ); 

fetch_1 = FOREACH datos GENERATE SUBSTRING(fecha,0,4) as ano;
fetch_2= GROUP fetch_1 by ano; 
fetch_3 = FOREACH fetch_2 GENERATE group, COUNT(fetch_1);

STORE fetch_3 INTO 'output/' USING PigStorage(',');
