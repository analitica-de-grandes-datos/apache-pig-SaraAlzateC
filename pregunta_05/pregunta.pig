/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
aparece cada letra minúscula en la columna 2.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data = LOAD 'data.tsv' USING PigStorage('\t') AS (col1: chararray, col2: bag{t: tuple(letter: chararray)}, col3: chararray);

letters = FOREACH data GENERATE FLATTEN(col2) as letter;

letter_counts = GROUP letters BY letter;
letter_counts = FOREACH letter_counts GENERATE group AS letter, COUNT(letters) AS count;

STORE letter_counts INTO 'output' USING PigStorage(',');

DUMP letter_counts;