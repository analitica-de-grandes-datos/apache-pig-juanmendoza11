/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       color 
   FROM 
       u 
   WHERE 
       color NOT LIKE 'b%';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

*/

datos = LOAD 'data.csv' USING PigStorage(',')
    AS (
        id:int,
        nombre:chararray,
        apellido:chararray,
        f_nac:chararray,
        color:chararray,
        id2:int         
        );

fetch_1 = FILTER datos BY NOT STARTSWITH(color,'b'); 
fetch_2 = FOREACH fetch_1 GENERATE color; 

STORE fetch_2 INTO 'output/' USING PigStorage(',');