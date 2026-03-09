/*The following function should use the pg_stat_statements extension
to count the number INSERT, SELECT, UPDATE and DELETE statements run in the database
and insert them in the total_run_commands table:
*/

create or replace function collect_total_run_commands()
returns void
language plpgsql
as $$
declare
	v_total_selects bigint;
	v_total_deletes bigint;
	v_total_updates bigint;
	v_total_inserts bigint;
begin
	select
		sum(calls) filter (where query ilike 'select%'),
		sum(calls) filter (where query ilike 'insert%'),
		sum(calls) filter (where query ilike 'update%'),
		sum(calls) filter (where query ilike 'delete%')
	into
		v_total_selects,
		v_total_inserts,
		v_total_updates,
		v_total_deletes
	from pg_stat_statements
	where dbid = (select oid from pg_database where datname = current_database());

    insert into total_run_commands (total_inserts, total_updates, total_deletes, total_selects)
    values (v_total_inserts, v_total_updates, v_total_deletes, v_total_selects);
end;
$$;

--You can check if the data was correctly saved into the table, running the following SELECT statement:

select * from total_run_commands;
