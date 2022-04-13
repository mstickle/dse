CREATE TABLE states (
    id               SERIAL PRIMARY KEY,
    state_name       TEXT,
    abbrev           TEXT
);

CREATE TABLE customers (
    id               SERIAL PRIMARY KEY,
    first_name       TEXT,
    last_name        TEXT,
    state_id         INTEGER REFERENCES states (id) NOT NULL
);

CREATE TABLE categories (
    id               SERIAL PRIMARY KEY,
    category_name    TEXT,
    category_desc    TEXT
);

CREATE TABLE products (
    id               SERIAL PRIMARY KEY,
    prod_name        TEXT,
    price            FLOAT CHECK (price > 0),
    category_id      INTEGER REFERENCES categories (id) NOT NULL
);

CREATE TABLE sales (
    id               SERIAL PRIMARY KEY,
    prod_id          INTEGER REFERENCES products (id) NOT NULL,
    customer_id      INTEGER REFERENCES customers (id) NOT NULL,
    quantity         INTEGER,
    discount         FLOAT CHECK (discount >= 0 AND discount <= 1)
);