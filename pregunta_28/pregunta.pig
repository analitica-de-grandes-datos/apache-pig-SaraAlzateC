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
data = LOAD 'data.csv' USING PigStorage(',') AS (id: int, firstname: chararray, lastname: chararray, birthday: chararray, color: chararray, number: int);

formatted_data = FOREACH data GENERATE SUBSTRING(birthday, 0, 4) AS yyyy, SUBSTRING(birthday, 2, 4) AS yy;

STORE formatted_data INTO 'output' USING PigStorage(',');

DUMP formatted_data;
