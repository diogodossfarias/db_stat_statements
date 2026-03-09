# Database DML statements statistics collection
This project provides a simple solution for monitoring the number of INSERT, SELECT, DELETE and UPDATE statements run in a Postgres database per hour.

It was created using the pg_stat_statements extension, pgSQL and PL/pgSQL for a Postgres database in an Azure Database for PostgreSQL flexible server instance.

## Allow the extension in your server

Before creating an extension for an Azure Database for PostgreSQL flexible server instance, it is necessary to allowlist them.

Search for your server in the Azure Database for PostgreSQL Flexible Servers area. Click on Server parameters, search for azure.extensions through the search box, select the PG_STAT_STATEMENTS box and save it. If you want to change the extension parameters, search for pg_stat_statement through the search box, set the parameters based on what you need, and don' t forget to save everything.

## Create the extension in your database

In your database, create the extension with the following command:

```
CREATE EXTENSION pg_stat_statements;
```

## Create the table to save your statistical data

To create your table, use the code in the file [create_table_total_run_command.sql](https://github.com/diogodossfarias/db_stat_statements/blob/main/create_table_total_run_commands.sql)

## Create the function to save your data into your table

To create this function, use the code in the file [create_function_collect_total_run_commands.sql](https://github.com/diogodossfarias/db_stat_statements/blob/main/create_function_collect_total_run_commands.sql)

## Create the function to show your hourly statistical data

To create this function, use the code in the file [create_function_show_total_run_commands.sql](https://github.com/diogodossfarias/db_stat_statements/blob/main/create_function_show_total_run_commands.sql)

## Create a bash script to collect your data automatically

To create a bash script to run your collect_total_run_commands() function, use the code in the file [b_mydb_ins_stats.bash](https://github.com/diogodossfarias/db_stat_statements/blob/main/b_mydb_ins_stats.bash)

## Create a bash script to export your data automatically

To create a bash script to run your show_total_run_commands() function, use the code in the file [b_mydb_query_stats.bash](https://github.com/diogodossfarias/db_stat_statements/blob/main/b_mydb_query_stats.bash)

## Automate your data collection using a cron job

## Automate you data export using a cronjob
