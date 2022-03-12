-- PART 1:
-- Rewrite the SQL table below to use a maximally efficient column order.
-- You may directly modify this table.

CREATE TABLE project (
   -- 256
   title CHAR(256),

   -- 16
   developer_id UUID,

   -- 8
   author_id BIGINT NOT NULL,
   created_at TIMESTAMP WITH TIME ZONE,
   updated_at TIMESTAMPTZ

   -- 4
   id SERIAL PRIMARY KEY,
   project_id INTEGER NOT NULL UNIQUE,
   target_id INTEGER,

   -- 2
   action SMALLINT NOT NULL,

   -- -1
   data TEXT,
   developer_addr INET,
   target_type VARCHAR(2)
);

-- PART 2:
-- Complete the table below describing the number of bytes used by the row created by the following insert statement.
-- Use the original column order defined above,
-- and not your modified order from part 1.

INSERT INTO project VALUES (
    0,
    55,
    NULL,
    NULL,
    NULL,
    'A0EEBC99-9C0B-4EF8-BB6D-6BB9BD380A11',
    NULL,
    NULL,
    88,
    12,
    'now',
    '2022-03-09T18:34:27+00:00'
);

-- Header: 24
-- Data: 56
-- Padding: 0
-- Total: 80
--
-- Calculations:
-- Header: 23 + 5/8 -> rounds to 24 bytes 
-- Data: 4 for id, 4 bytes for author_id alignment, 8 for author_id, 0 for target_type/target_id/developer_addr, 16 for developer_id, 0 for title/data, 4 for project_id, 2 for action, 2 for created_at alignment, 8 for created_at, 8 for updated_at
-- Padding: 0 because both header and data are divisible by 8
-- Total: 80, which is 24 + 56 + 0 
