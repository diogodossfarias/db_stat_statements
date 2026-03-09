/*To collect the number of SELECT, INSERT, DELETE and UPDATE statements in your database,
create a table as the following or adapt it the way you need it:
*/

CREATE TABLE total_run_commands (
    id serial primary key,
    total_inserts bigint,
    total_updates bigint,
    total_deletes bigint,
    total_selects bigint,
	collected_at timestamptz DEFAULT now()
);
