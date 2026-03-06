#!/bin/bash

#The following bash script runs the function collect_total_run_commands(), which inserts data about the number of INSERT, DELETE, UPDATE and SELECT statements into the table total_run_commands:

psql -U "postgres" -h "myserver.postgres.database.azure.com" -d "mydb" -c "SELECT collect_total_run_commands();"