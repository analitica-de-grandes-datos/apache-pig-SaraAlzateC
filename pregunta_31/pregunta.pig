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

data = LOAD 'data.csv' USING PigStorage(',') AS (id: int, firstname: chararray, lastname: chararray, birthday: chararray, color: chararray, number: int);

year_count = FOREACH data GENERATE SUBSTRING(birthday, 0, 4) AS year;

grouped_data = GROUP year_count BY year;
count_by_year = FOREACH grouped_data GENERATE group AS year, COUNT(year_count) AS count;

STORE count_by_year INTO 'output' USING PigStorage(',');

DUMP count_by_year;