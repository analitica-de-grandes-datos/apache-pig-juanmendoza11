/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       firstname 
   FROM 
       u 
   WHERE 
       SUBSTRING(firstname, 0, 1) >= 'm';

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
        f_nac:chararray,
        color:chararray,
        id2:int           
        ); 

filtro = FILTER datos BY SUBSTRING(nombre,0,1) >= 'M';
fetch_1 = FOREACH filtro GENERATE nombre;
STORE fetch_1 INTO 'output/' using PigStorage(',');