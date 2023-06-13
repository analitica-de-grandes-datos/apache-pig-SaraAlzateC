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

data = LOAD 'data.tsv' USING PigStorage('\t') AS (col1: chararray, col2: bag{t: tuple(letter: chararray)}, col3: chararray);

data_cleaned = FOREACH data GENERATE col1, col2, REPLACE(col3, '\\[', '') AS col3_cleaned;

records = FOREACH data_cleaned GENERATE FLATTEN(TOKENIZE(col3_cleaned, ',')) AS record;

key_counts = GROUP records BY SUBSTRING(record, 0, INDEXOF(record, '#'));
key_counts = FOREACH key_counts GENERATE group AS key, COUNT(records) AS count;

STORE key_counts INTO 'output' USING PigStorage(',');

DUMP key_counts;
