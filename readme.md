# Oracle JSON Sample Scripts
Oracle Database - External Table samples and datasets

This repository includes code samples and sample data for accessing Oracle External Tables.

The following datasets are provided as sample data-sets.  Please note the data in these samples is fictitious.

*This repo is for demonstration purposes only. Comments and issues may or may not be responded to.*

## Scripts:

### crDir.sql
This script creates an Oracle Directory Object in the database.  This is required to permit access to the file system from inside the Oracle database.  It provides a secure interface that prevents database users from dire ctly interfacing into the underlying operating system filesystem.

### createCred.sql
This script contains SQL code required to create an Oracle cloud credential in the database.  The credential can then be used to access the Oracle Object Storage.

### crjson.py
This simple python program uses the cx_Oracle Python extension module to communicate with Oracle.  The extension is available here:  https://oracle.github.io/python-cx_Oracle/
The script demonstrates how easy it is to connect to an Oracle database and operate upon JSON within the database.

### jq1.sql
This script demonstrates querying via SQL,  the newly created object that was just populated by the crjson.py python program.

### jq2.sql
This script demonstrates how easy it is to create a table with a JSON document in the Oracle Database.  In this case the database version is 19c, so we rely on the check constraint "IS JSON" to validate that the content conforms to JSON format.

### jq3.sql
This script demonstrates how it is possible to display regular Relational ROW-based data in a JSON document format without any special coding required.  This output could be ingested by an application that can read JSON.

### jq4.sql
In this example we are runnin a regular SQL Select operation against the JSON document.  We are using the JSON_Object function call to display the output with our specific JSON mappings.  Here we are converting the EMPNO to ID and the ENAME to NAME.  This way we can match the output to what our application is expects without having to perform any schema conversion or evolution.   

### jq6.sql
This script demonstrates the use of the JSON DataGuide which can derive the JSON Schema from sampling the JSON data.  We display the JSON Hierarchy, the definition and then a pretty format of the JSON document.

### jq7.sql
This script demonstrates the use of the JSON DataGuide which can derive the JSON Schema from sampling the JSON data.  In this example we generate a view called Auto-View which can dynamically present the json hieracrhy based on the contents of the json  document.

### jq10.sql
This script demonstrates loading JSON into the Oracle databae using an External Table.  The JSON file in this case is a raw dump file and is stored in a bucket in Oracle Object Storage.  This script relies on the Cloud Credential being already created in the database - this can be done using the demoscript- createCred.sql.  The file used in demo is the purchaseOrders.dmp and can be located in Github in the Oracle Sample Schemas repo. 

