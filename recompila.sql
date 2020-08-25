set lines 1000
set pages 0
spool objetos.txt
 select
    decode( OBJECT_TYPE,
        'PACKAGE BODY', 'alter package ' || OWNER||'.'||OBJECT_NAME || ' compile body;',
            'alter ' || OBJECT_TYPE || ' ' || OWNER||'."'||OBJECT_NAME || '" compile;' )
    from
        dba_objects a
    where
        STATUS = 'INVALID' and
        OBJECT_TYPE in ( 'PACKAGE BODY', 'PACKAGE', 'FUNCTION', 'PROCEDURE',
                         'TRIGGER', 'VIEW' )
   order by
       OBJECT_TYPE,
       OBJECT_NAME;
spool off
