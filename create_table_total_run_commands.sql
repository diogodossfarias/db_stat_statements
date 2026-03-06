CREATE TABLE total_run_commands (
    id serial primary key,
    total_inserts bigint,
    total_updates bigint,
    total_deletes bigint,
    total_selects bigint,
	collected_at timestamptz DEFAULT now()
);