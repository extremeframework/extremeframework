[DB_DataObject]
database_extremeframework-git     = mysql://root:@localhost/extremeframework-git
schema_location = D:/wamp/www/apps4clouds.com/apps/extremeframework-git/schema
class_location  = D:/wamp/www/apps4clouds.com/apps/extremeframework-git/shared/table
require_prefix  = DataObject/
class_prefix    = DataObject_
extends = DB_DataObject
extends_location = DB/DataObject.php
db_driver = mysql
debug = 0
quote_identifiers = 1

[MDB2]
quote_identifier = 1
