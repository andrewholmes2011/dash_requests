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
 created_at TEXT NOT NULL,
 student_id TEXT
);
CREATE INDEX IF NOT EXISTS idx_requests_created ON requests(created_at DESC);
CREATE INDEX IF NOT EXISTS idx_requests_status ON requests(status);
CREATE INDEX IF NOT EXISTS idx_requests_student ON requests(student_id);

CREATE TABLE IF NOT EXISTS student_accounts (
 id TEXT PRIMARY KEY,
 username TEXT NOT NULL UNIQUE COLLATE NOCASE,
 display_name TEXT NOT NULL,
 class_name TEXT NOT NULL DEFAULT '',
 password_salt TEXT NOT NULL,
 password_hash TEXT NOT NULL,
 active INTEGER NOT NULL DEFAULT 1,
 created_at TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS student_sessions (
 token_hash TEXT PRIMARY KEY,
 account_id TEXT NOT NULL,
 expires_at TEXT NOT NULL,
 created_at TEXT NOT NULL,
 FOREIGN KEY(account_id) REFERENCES student_accounts(id) ON DELETE CASCADE
);
CREATE INDEX IF NOT EXISTS idx_student_sessions_expiry ON student_sessions(expires_at);
