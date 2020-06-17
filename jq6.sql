set long 1000000 pagesize 1000
set pause on
set pause "Press Enter to continue..."
 
select json_dataguide(json_data) 
from test_json  ;

select json_dataguide(json_data, 
       dbms_json.format_flat, dbms_json.pretty) 
from test_json  ;

select json_query(json_data, '$.phoneNumbers.type[*]' WITH WRAPPER) from test_json  ;

select json_serialize(json_data returning varchar2 pretty) pretty_js from test_json  
/
set pause off


