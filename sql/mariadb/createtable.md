---
id: hnyhtwpphh5g8kjzeohpa0
title: sql/mariadb/createtable
desc: ''
updated: 1717388053
created: 1717388053
---
# sql/mariadb/createtable

## Quick Start

```sql
USE pkmn;

CREATE OR REPLACE TABLE pkmn_type(
   pkmn_type_id INT PRIMARY KEY AUTO_INCREMENT,
   type_name VARCHAR(25)
);

CREATE TABlE type_effective(
   pkmn_type_id INT NOT NULL,
   pkmn_effective_id INT NOT NULL,

   CONSTRAINT `fk_pkmn_primary` FOREIGN KEY (pkmn_type_id) REFERENCES pkmn_type(pkmn_type_id),
   CONSTRAINT `fk_pkmn_effective` FOREIGN KEY (pkmn_effective_id) REFERENCES pkmn_type(pkmn_type_id),

   CONSTRAINT PRIMARY KEY(pkmn_type_id,pkmn_effective_id)
);

```

## About

you can create a table in sql using the create table command, however there
are several different configurations that you can use when creating such a table
involving constraints and primary keys

the quick start above offers one such configuration that is an example for many different techniques that
you might want to perform with the table
