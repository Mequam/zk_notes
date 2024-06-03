---
id: mxyrwl3k18c19cu0h7fo0d
title: sql/mariadb
desc: ''
updated: 1717389173
created: 1717389173
---
# sql/mariadb

## About

mariadb is an open source fork of mysql and is the primary sql server recomended by arch linux :)

you can find commands and notes on it under sql/mariadb/*

### Quick Start Example

see [sql/mariadb/grantdb](mariadb/grantdb) for getting permision to work with the database

```sql
USE pkmn;

DROP TABLE type_effective;
DROP TABLE pkmn_type;

CREATE OR REPLACE TABLE pkmn_type(
   pkmn_type_id INT PRIMARY KEY AUTO_INCREMENT,
   type_name VARCHAR(25)
);

CREATE OR REPLACE TABlE type_effective(
   pkmn_type_id INT NOT NULL,
   pkmn_effective_id INT NOT NULL,

   CONSTRAINT `fk_pkmn_primary` FOREIGN KEY (pkmn_type_id) REFERENCES pkmn_type(pkmn_type_id),
   CONSTRAINT `fk_pkmn_effective` FOREIGN KEY (pkmn_effective_id) REFERENCES pkmn_type(pkmn_type_id),

   CONSTRAINT PRIMARY KEY(pkmn_type_id,pkmn_effective_id)
);


ALTER TABLE pkmn_type MODIFY COLUMN type_name VARCHAR(25) NOT NULL;
ALTER TABLE pkmn_type DROP COLUMN type_name;
ALTER TABLE pkmn_type ADD COLUMN type_name VARCHAR(25) NOT NULL;
```

## Links

[sql/mariadb/alter_table](mariadb/alter_table)
[sql/mariadb/createtable](mariadb/createtable)
[sql/mariadb/table](mariadb/table)
[sql/mariadb/grantdb](mariadb/grantdb)
