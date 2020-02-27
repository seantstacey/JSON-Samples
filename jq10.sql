
-- -----------------------------------------------------------------------------
-- Demo: Load JSON Objects Using External Tables 
-- 
-- Note: In order to access an External Table we need to first create a DIRECTORY
--       object in the database to indicate where the file being mapped as an  
--       External Table will be located.  The same location will be used to hold 
--       the BADFILE, DISCARDFILE and LOGFILE. The DIRECTORY is created as follows:
-- 
--       CREATE OR REPLACE DIRECTORY JSON_DIR AS '/home/oracle/Downloads';
--       GRANT READ ON DIRECTORY JSON_DIR TO <USER>;
--       GRANT WRITE ON DIRECTORY JSON_DIR TO <USER>;
--

-- -----------------------------------------------------------------------------

SET DEFINE OFF
SET PAUSE ON
SET ECHO ON

drop table json_purchase_orders ;

CREATE TABLE json_purchase_orders (json_document BLOB)
  ORGANIZATION EXTERNAL (TYPE ORACLE_LOADER DEFAULT DIRECTORY JSON_DIR
                         ACCESS PARAMETERS
                           (RECORDS DELIMITED BY 0x'0A'
                            DISABLE_DIRECTORY_LINK_CHECK
                            FIELDS (json_document CHAR(5000)))
                         LOCATION (JSON_DIR:'PurchaseOrders.dmp'))
  PARALLEL
  REJECT LIMIT UNLIMITED
/


select * from json_purchase_orders 
where rownum < 2
/

select json_serialize(json_document returning varchar2 pretty) pretty_js 
from   json_purchase_orders 
where  rownum < 2
/




