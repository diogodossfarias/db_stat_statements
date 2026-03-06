#!/bin/bash

#The following bash script run the function show_total_run_commands(), which returns the number of INSERT, DELETE, UPDATE and SELECT statements run in a timespan of one hour in the database:

psql -U "postgres" -h "myserver.postgres.database.azure.com" -d "mydb" -c "SELECT show_total_run_commands();"