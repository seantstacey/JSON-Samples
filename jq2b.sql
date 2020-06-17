set pause on
drop table fanGear ;

create table fanGear (
       po_no number,
       po_doc CLOB, 
       check (po_doc IS JSON) );

desc fanGear

insert into fanGear values (2323, '{"Item":"Sweatshirt", 
                                    "Color": "Carolina Blue",
                                    "Size": "XL",
                                    "Special Instructions": "Monogram- white 23" }') ;
insert into fanGear values (1441, '{"Item":"Hoodie",
                                    "Color": "Crimson Red",
                                    "Size": "M" }') ;
insert into fanGear values (5676, '{"Item":"Sweatshirt",
                                    "Color": "Cardinal Red",
                                    "Size": "S",
                                    "Special Instructions": "Monogram- Fear the Tree" }') ;

select po_no, json_serialize(po_doc returning varchar2 pretty) pretty_js 
       from fanGear ;

UPDATE fanGear SET po_doc = json_mergepatch
      ( po_doc, '{"Special Instructions":null}' ) ;

select po_no, json_serialize(po_doc returning varchar2 pretty) pretty_js 
       from fanGear 

/

set pause off
