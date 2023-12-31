/*
Pregunta
===========================================================================

Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
columna 3 separados por coma. La tabla debe estar ordenada por las 
columnas 1, 2 y 3.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data = LOAD 'data.tsv' AS (col1: chararray, col2: bag{}, col3: map[]);

table = FOREACH data GENERATE col1, SIZE(col2) AS col2_count, SIZE(col3) AS col3_count;

sorted_table = ORDER table BY col1, col2_count, col3_count;

STORE sorted_table INTO 'output' USING PigStorage(',');
DUMP sorted_table;