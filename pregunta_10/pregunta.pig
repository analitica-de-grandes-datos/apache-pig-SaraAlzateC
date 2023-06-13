/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Genere una relación con el apellido y su longitud. Ordene por longitud y 
por apellido. Obtenga la siguiente salida.

  Hamilton,8
  Garrett,7
  Holcomb,7
  Coffey,6
  Conway,6

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

data = LOAD 'data.csv' USING PigStorage(',') AS (col1: chararray, col2: chararray, col3: chararray);

relation = FOREACH data GENERATE col3 AS apellido, SIZE(col3) AS longitud;

sorted_relation = ORDER relation BY longitud DESC, apellido;

limited_relation = LIMIT sorted_relation 5;

STORE limited_relation INTO 'output' USING PigStorage(',');

DUMP limited_relation;