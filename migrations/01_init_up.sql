CREATE TABLE default.event_log (message String) 
ENGINE = Kafka('host.docker.internal:9092', 'Nsms', 'group1', 'LineAsString');

CREATE MATERIALIZED VIEW default.event_log_view
ENGINE = Memory
AS
SELECT * FROM default.event_log
SETTINGS
stream_like_engine_allow_direct_select = 1;