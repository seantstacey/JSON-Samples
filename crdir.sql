CREATE OR REPLACE DIRECTORY EXTTAB_DIR AS '/home/oracle/Downloads';
GRANT READ ON DIRECTORY JSON_DIR TO <USER>;
GRANT WRITE ON DIRECTORY JSON_DIR TO <USER>;


DECLARE 
 l_file utl_file.file_type;
BEGIN
 l_file := utl_file.fopen('JSON_DIR', 'foobar.txt', 'W') ;
 utl_file.put_line(l_file, 'hello world') ;
 utl_file.fclose(l_file);
END ;
 
