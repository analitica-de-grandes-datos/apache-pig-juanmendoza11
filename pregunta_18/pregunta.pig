/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       firstname, 
       color 
   FROM 
       u
   WHERE color NOT IN ('blue','black');

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        /* >>> Escriba su respuesta a partir de este punto <<< */

datos = LOAD 'data.csv' USING PigStorage(',')
    AS (
        id:int,
        nombre:chararray,
        apellido:chararray,
        fecha:chararray,
        color:chararray,
        id2:int         
        ); 

fetch_1 = FILTER datos BY NOT STARTSWITH(color,'blue') AND NOT STARTSWITH(color,'black'); 
fetch_2 = FOREACH fetch_1 GENERATE nombre, color; 

STORE fetch_2 INTO 'output/' USING PigStorage(',');