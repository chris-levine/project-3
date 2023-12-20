-- create tables
create table bitcoin (
    id INTEGER primary key NOT NULL,
    name VARCHAR NOT NULL,
    symbol VARCHAR NOT NULL,
	date TIMESTAMP NOT NULL,
	daily_high float NOT NULL,
	daily_low float NOT NULL,
	open_price float NOT NULL,
	close_price float NOT NULL,
	volume float NOT NULL,
	marketcap float NOT NULL
);



create table cardano (
    id INTEGER primary key NOT NULL,
    name VARCHAR NOT NULL,
    symbol VARCHAR NOT NULL,
	date TIMESTAMP NOT NULL,
	daily_high float NOT NULL,
	daily_low float NOT NULL,
	open_price float NOT NULL,
	close_price float NOT NULL,
	volume float NOT NULL,
	marketcap float NOT NULL
);



create table dogecoin (
    id INTEGER primary key NOT NULL,
    name VARCHAR NOT NULL,
    symbol VARCHAR NOT NULL,
	date TIMESTAMP NOT NULL,
	daily_high float NOT NULL,
	daily_low float NOT NULL,
	open_price float NOT NULL,
	close_price float NOT NULL,
	volume float NOT NULL,
	marketcap float NOT NULL
);



create table ethereum (
    id INTEGER primary key NOT NULL,
    name VARCHAR NOT NULL,
    symbol VARCHAR NOT NULL,
	date TIMESTAMP NOT NULL,
	daily_high float NOT NULL,
	daily_low float NOT NULL,
	open_price float NOT NULL,
	close_price float NOT NULL,
	volume float NOT NULL,
	marketcap float NOT NULL
);



create table tether (
    id INTEGER primary key NOT NULL,
    name VARCHAR NOT NULL,
    symbol VARCHAR NOT NULL,
	date TIMESTAMP NOT NULL,
	daily_high float NOT NULL,
	daily_low float NOT NULL,
	open_price float NOT NULL,
	close_price float NOT NULL,
	volume float NOT NULL,
	marketcap float NOT NULL
);


create table xrp (
    id INTEGER primary key NOT NULL,
    name VARCHAR NOT NULL,
    symbol VARCHAR NOT NULL,
	date TIMESTAMP NOT NULL,
	daily_high float NOT NULL,
	daily_low float NOT NULL,
	open_price float NOT NULL,
	close_price float NOT NULL,
	volume float NOT NULL,
	marketcap float NOT NULL
);


-- test select statements to check that imports worked
SELECT * FROM bitcoin LIMIT 5;
SELECT * FROM cardano LIMIT 5;
SELECT * FROM dogecoin LIMIT 5;
SELECT * FROM ethereum LIMIT 5;
SELECT * FROM tether LIMIT 5;
SELECT * FROM xrp LIMIT 5;