DROP FUNCTION cluster_stat_io_format(integer, integer, integer);
DROP FUNCTION cluster_stat_io_format(integer, integer, integer, integer, integer);
DROP FUNCTION cluster_stat_slru_format(integer, integer, integer);
DROP FUNCTION cluster_stat_slru_format(integer, integer, integer, integer, integer);
DROP FUNCTION wal_stats_format(integer, integer, integer, numeric);
DROP FUNCTION wal_stats_format_diff(integer, integer, integer, integer, integer, numeric, numeric);
DROP FUNCTION get_report_datasets(jsonb, integer);
DROP FUNCTION drop_server(name);
DROP FUNCTION import_data;
DROP FUNCTION report_queries_format;
DROP FUNCTION sections_jsonb;
DROP FUNCTION collect_pg_stat_statements_stats;
