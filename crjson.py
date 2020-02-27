import cx_Oracle
con = cx_Oracle.connect('<username>/<password>@<databaseName')
cur = con.cursor()
cur.execute('create table test_json (id number generated always as identity, json_data clob)')

cur.execute('select * from test_json') 

## Display result set
for row in cur:
    print row

cur.execute('insert into test_json(json_data) values (\'{"firstName": "John", "lastName": "Smith" , "Age": 25, "address": {"street": "21 2nd street", "city": "New York", "state": "NY", "postalCode": "10021", "isBusiness": "false"}, "phoneNumbers": [{ "type": "home", "number": "212-555-1234"},{"type": "mobile", "number": "646-555-4567"}]}\')')

cur.execute('commit')

## Query table data once more time.
cur.execute('select * from test_json')

for row in cur:
    print row

## Retrieve only the First Name.
cur.execute('select json_value(json_data, \'$.firstName\') from test_json')

for row in cur:
    print row

cur.execute('select json_value(json_data, \'$.title\') from test_json')
for row in cur:
    print row

cur.close()
con.close()
