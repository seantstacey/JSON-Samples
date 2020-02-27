
##Scripts:

###crDir.sql
This script creates an Oracle Directory Object in the database.  This is required to permit access to the file system from inside the Oracle database.  It provides a secure interface that prevents database users from dire ctly interfacing into the underlying operating system filesystem.

###createCred.sql
This script contains SQL code required to create an Oracle cloud credential in the database.  The credential can then be used to access the Oracle Object Storage.

###crjson.py
This simple python program uses the cx_Oracle Python extension module to communicate with Oracle.  The extension is available here:  https://oracle.github.io/python-cx_Oracle/
The script demonstrates how easy it is to connect to an Oracle database and operate upon JSON within the database.

###jq1.sql
This script demonstrates an inline External Table. This form of external table is ephemeral in that the definition is only persisted during the life of the sql code. There is no requirement to drop the external table once the operation has completed.

###jq2.sql
There is little to demonstrate in script itself,  the main purpose of this demonstration is to show simultaneous access to a single External Table from multiple pluggable databases.

###jq3.sql
This script demonstrates how an External Table can be partitioned.  In this example we are Range partitioning based on multiple csv files.  This approach can help with performance as reads from the External Table can be parallelized.  This approach can also be useful when working with multiple data streams. 

###jq4.sql
This script demonstrates Oracle Hybrid Partitioned Tables.  In this instance we are are creating a range-partitioned table.  The warmer (more recent) data is stored inside the database and the colder (older) data is stored in an external table.
  
###jq5.sql
This script demonstrates how an External Table can be populated into the Oracle Database In-Memory Columnar Store. Be aware that for this script to see any benefit, the dataset  will need to be larger than 64K.

###jq6.sql
This is Part Two of a demonstration of using External Tables with the DATAPUMP Access driver. In this example we create an external table in a different database (or Pluggable Database) then the database where we created the external table from.  The dump file can then be loaded into this using the External Table approach or datapump.   

###jq7.sql
This script demonstrates using an External Table to load a raw JSON file using the DATAPUMP Access driver.  The benefit of the DATAPUMP access driver in this case is that it can simplify working with BLOB objects and can be parallelized for speeding up data ingest.  

###jq10.sql
This script demonstrates creating an External Table using a file stored in a bucket in Oracle Object Storage.  This script relies on the Cloud Credential being already created in the database - this can be done using the demoscript- createCred.sql.

