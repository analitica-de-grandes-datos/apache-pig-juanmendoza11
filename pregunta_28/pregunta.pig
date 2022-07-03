/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       birthday, 
       DATE_FORMAT(birthday, "yyyy"),
       DATE_FORMAT(birthday, "yy"),
   FROM 
       persons
   LIMIT
       5;

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

fetch_1 = FOREACH datos GENERATE SUBSTRING(fecha,0,4) as ano, SUBSTRING(fecha,2,4)as ano_1;

STORE fetch_1 INTO 'output/' USING PigStorage(',');
