-- -----------------------------------------------------------------------------------
-- Demo:  jq7.sql
-- 
-- Demonstrates the use of the JSON DataGuide for JSON Discovery
-- -----------------------------------------------------------------------------------

set pause on
set echo on
 
declare 
   dguide clob ;
begin
   select json_dataguide(json_data, DBMS_JSON.FORMAT_HIERARCHICAL) 
   into dguide from test_json  ;

   dbms_json.create_view('auto_view', 'test_json', 'json_data', dguide );
end ;
/

desc auto_view

select "postalCode", "city" 
from   auto_view
order  by "state"
/

 set echo off
set pause off
