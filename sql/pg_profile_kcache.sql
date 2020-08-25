CREATE SCHEMA IF NOT EXISTS profile;
CREATE SCHEMA IF NOT EXISTS dblink;
CREATE SCHEMA IF NOT EXISTS statements;
CREATE SCHEMA IF NOT EXISTS kcache;
CREATE EXTENSION dblink SCHEMA dblink;
CREATE EXTENSION pg_stat_statements SCHEMA statements;
CREATE EXTENSION pg_stat_kcache SCHEMA kcache;
CREATE EXTENSION pg_profile SCHEMA profile;
SELECT * FROM profile.take_sample();
SELECT * FROM profile.take_sample();
SELECT count(1) FROM profile.get_report(1,2);
SELECT * FROM profile.take_sample();
SELECT count(1) FROM profile.get_diffreport(1,2,2,3);
SELECT * FROM profile.take_sample();
SELECT * FROM profile.take_sample();
UPDATE profile.samples SET sample_time = now() - '4 days'::interval - '10 minutes'::interval WHERE server_id = 1 AND sample_id = 1;
UPDATE profile.samples SET sample_time = now() - '3 days'::interval - '10 minutes'::interval WHERE server_id = 1 AND sample_id = 2;
UPDATE profile.samples SET sample_time = now() - '2 days'::interval - '10 minutes'::interval WHERE server_id = 1 AND sample_id = 3;
UPDATE profile.samples SET sample_time = now() - '1 days'::interval - '10 minutes'::interval WHERE server_id = 1 AND sample_id = 4;
UPDATE profile.samples SET sample_time = now() - '23 hours'::interval - '10 minutes'::interval WHERE server_id = 1 AND sample_id = 5;
SELECT * FROM profile.take_sample();
SELECT COUNT(*) FROM profile.samples WHERE sample_time < now() - '1 days'::interval;
SELECT * FROM profile.set_server_max_sample_age('local',1);
SELECT * FROM profile.take_sample();
SELECT COUNT(*) FROM profile.samples WHERE sample_time < now() - '1 days'::interval;
DROP EXTENSION pg_profile;
DROP EXTENSION pg_stat_kcache;
DROP EXTENSION pg_stat_statements;
DROP EXTENSION dblink;
DROP SCHEMA profile;
DROP SCHEMA dblink;
DROP SCHEMA statements;
DROP SCHEMA kcache;