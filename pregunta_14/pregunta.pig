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
data = LOAD 'data.csv' USING PigStorage(',') AS (col1: int, col2: chararray, col3: chararray, col4: chararray, col5: chararray, col6: int);

filtered_data = FILTER data BY NOT (col5 MATCHES '^b.*');

result = FOREACH filtered_data GENERATE col5;

STORE result INTO 'output' USING PigStorage(',');

DUMP result;
