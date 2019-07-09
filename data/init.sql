CREATE TABLE person(
	id serial PRIMARY KEY,
	name VARCHAR(512) UNIQUE NOT NULL,
	age int NOT NULL,
	height int NOT NULL
);

