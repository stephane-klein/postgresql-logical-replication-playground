# PostgreSQL 12 logical replication playground

Project Status: Work in Progress, see issues for more informaiton.

PostgreSQL 12 [logical replication](https://www.postgresql.org/docs/current/logical-replication.html) playground, based on this documentation: [Logical Replication in PostgreSQL Explained](https://www.enterprisedb.com/postgres-tutorials/logical-replication-postgresql-explained)

```
$ docker-compose up -d postgres1
$ ./scripts/wait-service.sh postgres1 5432
```

```
$ ./scripts/pg1/load-configuration.sh
$ ./scripts/pg1/load-seed.sh
$ ./scripts/pg1/insert-fixtures.sh
```

```
$ docker-compose up -d postgres2
$ ./scripts/wait-service.sh postgres2 5432
```

```
$ ./scripts/pg2/create-extensions.sh
$ ./scripts/pg2/copy-from-pg1.sh
$ ./scripts/pg2/create-subscriptions.sh
```

```
$ ./scripts/pg2/query.sh
count
-------
    10
$ ./scripts/pg1/insert-fixtures.sh
$ ./scripts/pg2/query.sh
count
-------
    20
```