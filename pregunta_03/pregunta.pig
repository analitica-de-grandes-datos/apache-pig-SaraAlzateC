/*
Pregunta
===========================================================================

Obtenga los cinco (5) valores más pequeños de la 3ra columna.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data = LOAD 'data.tsv' USING PigStorage('\t') AS (col1: chararray, col2: chararray, col3: int);

ranked_data = RANK data BY col3;

filtered_data = FILTER ranked_data BY $0 <= 5;

sorted_data = ORDER filtered_data BY $0;

result = FOREACH sorted_data GENERATE col3;

STORE result INTO 'output' USING PigStorage(',');

DUMP result;