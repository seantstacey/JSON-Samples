drop table product ;
set pause on
create table product(
     prodid number,
     prodname varchar2(50),
     version varchar2(20),
     features CLOB,
     check (features IS JSON ) ) ;


insert into product values (1, 'Database', '12.1.0.2', '{features: ["DB In-Memory", "JSON Support", "Advanced Index Compression"]}') ;

insert into product values (2, 'Database', '12.2.0.1', '{features: ["DB Sharding", "PDB Clone and Relocate", "Online DB Encryption"]}' ) ;

insert into product values (3, 'Database', '18c', '{features: ["Active Directory Integration", "In-Memory for Key-Value", "Private Temporary Tables"]}' ) ;

select * from product
/


select prodname, version, json_serialize(features returning varchar2 pretty) pretty_js from product  

set pause off
/


