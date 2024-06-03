---
id: ae6t9bjyrnvioqk6ycu44y
title: sql/mariadb/grantdb
desc: ''
updated: 1717385810
created: 1717385810
---
# sql/mariadb/grantdb

## Quick Reference

```sql
GRANT ALL PRIVILEGES ON pkmn.* TO 'j0hn'@'localhost';
```

## About

when you create a database in mariadb as root you need to be able 
to grant that database to a user the above command is a quick start
to actually granting the db privlages, in this case for a db named
pkm

also note it *appears* in my research that % is a placeholder that can be
used in place of localhost so that the user can access the database from
anywhere
