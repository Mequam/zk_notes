---
id: woy09lsagh7rg6kb6kqsim
title: sql/mariadb/connect
desc: ''
updated: 1717388247
created: 1717388247
---
# sql/mariadb/connect

## Quick Start
```bash
mariadb <database name> -p < sql_file.sql

<input password>
```

## About

the above command connects to a mariadb server to send commands and data to, in this case
sending commands from a give nsql file to the connection.

Make sure that you have propper permisions for the database you are trying to connect to or the command will
fail with an error! 

See  [sql/mariadb/grantdb](grantdb) for how to actually grant privlages to access any given database
