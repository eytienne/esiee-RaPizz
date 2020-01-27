select 'DELETE FROM '||table_name||';' from information_schema.tables where table_schema = 'public';

select 'SELECT * FROM '||table_name||';' from information_schema.tables where table_schema = 'public';