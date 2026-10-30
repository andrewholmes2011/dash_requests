CREATE TABLE IF NOT EXISTS requests (
 id TEXT PRIMARY KEY,
 student TEXT NOT NULL,
 class_name TEXT NOT NULL,
 request_type TEXT NOT NULL,
 assignment TEXT,
 due_date TEXT,
 requested_date TEXT,
 reason TEXT NOT NULL,
 status TEXT NOT NULL DEFAULT 'Pending',
 teacher_response TEXT NOT NULL DEFAULT '',
 created_at TEXT NOT NULL
);
CREATE INDEX IF NOT EXISTS idx_requests_created ON requests(created_at DESC);
CREATE INDEX IF NOT EXISTS idx_requests_status ON requests(status);
