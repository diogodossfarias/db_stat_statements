# Database DML statements statistics collection
This project provides a simple solution for monitoring the number of INSERT, SELECT, DELETE and UPDATE statements run in a Postgres database per hour.

It was created using the pg_stat_statements extension, pgSQL and PL/pgSQL for a Postgres database in an Azure Database for PostgreSQL flexible server instance.

## Allow the extension in your server

Before creating an extension for an Azure Database for PostgreSQL flexible server instance, it is necessary to allowlist them.

Search your server in Flexible servers Azure Database for PostgreSQL. Click on Server parameters, search for azure.extensions and select the PG_STAT_STATEMENTS box and save it. If you want to change the extenearch for pg_stat_stasion parameters, stements. Don' t forget to save everything.

## Create the extension in your database

In your database, create the extension with the following command:

```
CREATE EXTENSION pg_stat_statements;
```

## Create the table to save your statistical data

To create your table, use the code in the file create_table_total_run_command.sql

## Create the function to save your data into your table

To create this function, use the code in the file [create_function_collect_total_run_commands.sql](/create_funtion_collect_total_run_commands.sql)

## Create the function to show your hourly statistical data

To create this function, use the code in the file create_function_show_total_run_commands.sql

