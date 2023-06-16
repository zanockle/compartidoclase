alter session set "_ORACLE_SCRIPT"=true;
SELECT tablespace_name,
       round((bytes) / 1024 / 1024, 2) AS total_size_mb
      
FROM dba_free_space;

describe dba_free_space;

CREATE USER NORTHWIND IDENTIFIED BY "Abc123456*/*";
GRANT DBA TO NORTHWIND;
ALTER USER NORTHWIND DEFAULT TABLESPACE users;
ALTER USER NORTHWIND QUOTA UNLIMITED ON users;


