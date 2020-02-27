begin
 declare
   dguide clob;
 begin
   select json_dataguide(json_data, 
--                          dbms_json.FORMAT_HIERARCHICAL)   
                         dbms_json.FORMAT_FLAT)   
   into dguide from test_json;
   dbms_json.create_view('auto_view','test_json','json_data',dguide);
 end;
end;
/

desc auto_view;

select "postalCode", "city" 
from   auto_view 
order by "state"
/

