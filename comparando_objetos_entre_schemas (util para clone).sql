SELECT   owner, COUNT (*) objetos
    FROM dba_objects
   WHERE owner NOT IN ('SYS', 'SYSTEM', 'OUTLN', 'DBSNMP', 'OPS$OPERACAO','PERFSTAT')
GROUP BY owner
ORDER BY owner
