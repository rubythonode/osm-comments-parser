\COPY changesets(id, created_at, closed_at, is_open, user_id, username, comment, source, created_by, imagery_used, num_changes, discussion_count, is_unreplied, min_lon, min_lat, max_lon, max_lat) FROM 'csv/changesets.csv' DELIMITERS ',' CSV;

UPDATE changesets SET bbox = ST_MakeEnvelope(min_lon, min_lat, max_lon, max_lat, 4326);

\COPY users(id,name,first_edit,changeset_count,num_changes) FROM 'csv/users.csv' DELIMITERS ',' CSV;

\COPY changeset_comments(id, changeset_id, user_id, username, timestamp, comment) FROM 'csv/comments.csv' DELIMITERS ',' CSV;
