/*
Pregunta
===========================================================================

Obtenga los cinco (5) valores más pequeños de la 3ra columna.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
lines = LOAD 'data.tsv' USING PigStorage('\t') as (a:chararray,b:chararray,c:int);
sortdata = ORDER lines BY c;
limitdata = LIMIT sortdata 5;
foreachdata = FOREACH limitdata GENERATE c;
STORE foreachdata INTO 'output' USING PigStorage (',');