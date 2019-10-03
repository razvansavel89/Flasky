-- Initialize the database.
-- Drop any existing data and create empty tables.

DROP TABLE IF EXISTS user;

CREATE TABLE user (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  username TEXT UNIQUE NOT NULL,
  password TEXT NOT NULL,
  firstname TEXT,
  lastname TEXT,
  phone TEXT,
  token TEXT
);

INSERT into user(username, password, firstname, lastname, phone)
    values ('razvan.savel',
            'pbkdf2:sha256:50000$NJkJMWdl$8686be06f7498fb9af97de12fdba4de2f209c9db4013a5fb737ecd7337f8d9c0',
            'Razvan',
            'Savel',
            '0751459410'),
     ('test_user',
            'pbkdf2:sha256:50000$QRHayHI8$fe9df78eb19d38e95aa740fd56c5daae3892770509cff694520fe6d678062eb9',
            'Michael',
            'Douglas',
            '+00402479291278461'
);