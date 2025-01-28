---
id: jvhh6xxwt358ydwdatgs4c
title: mongodb
desc: ''
updated: 1737488649
created: 1737488649
---
# mongodb

## About

mongodb is a document based database that uses no sql functionality

## Installation

the following will install the mongodb client provided
by mongodb.com

[mongodb.com](https://www.mongodb.com/resources/languages/mongodb-with-nodejs)

```bash
npm install mongodb
```

mongodb can be installed locally or run from a remote machine in the cloud,
either way a connection string to the database is used and will need to be
provided to mongodb

### Cloud Setup

in order to use mongodb you need to use a connection string,
you get this connection string from creating a database at
[mongodb.com](mongodb.com)

follow the steps on the above link to create an online db that works for you

### Example

the following is example code from a typescript resouce
application

```typescript

import {MongoClient,ServerApiVersion, Db,ObjectId,OptionalId, Collection} from "mongodb";

/*
 * this class serves as the base class for service classes in the application to store global configurations
 * and code that all of them should inherit
 * */
export default class ResourceService<ObjectType> {
   
   //singleton database connection object
   protected database_connection : MongoClient | null = null;

   constructor(public collectionName : string) {}
   
   /*
    * singleton pattern to get the connection to the database,
    * according to several sources online, mongodb prefers a single connection
    * architecture as it will reccord and track extra connections on the server
    * end
    * */
   async get_connection() : Promise<MongoClient> {
      if (!process.env.DB_CONN_STRING) throw new Error("unset connection string");

      if (this.database_connection) return this.database_connection;

      let client = new MongoClient(process.env.DB_CONN_STRING,  {
              serverApi: {
                  version: ServerApiVersion.v1,
                  strict: true,
                  deprecationErrors: true,
              }
          }
      );

      await client.connect();

      this.database_connection = client;

      return this.database_connection;
   }

   /**
   * function that closes the current singleton that this object is using
   * note that his should be used sparingly, as mongodb likes you to keep connections open
   * for the duration of your app
   * */
    async close_connection() : Promise<void> {
      if (this.database_connection)
         await this.database_connection.close();
   }

   async get_database() : Promise<Db> {
      let connection = await this.get_connection();
      return connection.db(process.env.DB_NAME);
   }
   async get_collection() : Promise<Collection> {
      let database : Db = await this.get_database();
      return database.collection(this.collectionName);
   }

   async find(query : any) {
      const collection = await this.get_collection();
      return collection.find(query);
   }
   async create(object : ObjectType) {
      let collection = await this.get_collection();
      return await collection.insertOne(object as OptionalId<Document>);
   }
}
```


