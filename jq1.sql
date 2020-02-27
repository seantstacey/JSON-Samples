set pause on
set echo on
select * from test_json;

select json_serialize(json_data returning varchar2 pretty) pretty_js from test_json  

set echo off
/


