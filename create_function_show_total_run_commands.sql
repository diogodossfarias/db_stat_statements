/*The following function should show the number of
SELECT, INSERT, DELETE and UPDATE statements run in the database
in the last hour:
*/

create or replace function show_total_run_commands()
returns table(
    inserts_last_hour bigint,
    updates_last_hour bigint,
    deletes_last_hour bigint,
    rows_selected_last_hour bigint,
	hour_start timestamptz
)
language plpgsql
as $$
declare
    start_hour timestamptz;
    end_hour timestamptz;
begin
    start_hour := date_trunc('hour', now()) - interval '1 hour';
    end_hour   := date_trunc('hour', now());

    return query
    select
        max(coalesce(total_inserts,0)) - min(coalesce(total_inserts,0)),
        max(coalesce(total_updates,0)) - min(coalesce(total_updates,0)),
        max(coalesce(total_deletes,0)) - min(coalesce(total_deletes,0)),
        max(coalesce(total_selects,0)) - min(coalesce(total_selects,0)),
		start_hour
    from total_run_commands s
    where s.collected_at >= start_hour
      and s.collected_at < end_hour;
end;
$$;

--you can run the function show_total_run_commands() using the following statement:
select * from show_total_run_commands();

