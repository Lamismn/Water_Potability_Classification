CREATE TABLE water_data(
	station_code INT NOT NULL,
	areas VARCHAR(200) NOT NULL,
	region VARCHAR(40) NOT NULL,
	tempurature FLOAT NOT NULL,
	dis_oxy FLOAT NOT NULL,
	ph FLOAT NOT NULL,
	conduct FLOAT NOT NULL,
	bod FLOAT NOT NULL,
	nit FLOAT NOT NULL,
	coli FLOAT NOT NULL,
	total_coli FLOAT NOT NULL,
	PRIMARY KEY(station_code)	
);
CREATE TABLE potability (
	station_code INT NOT NULL,
	potable INT NOT NULL,
	FOREIGN KEY(station_code) REFERENCES water_data(station_code),
	PRIMARY KEY(station_code)
);

CREATE TABLE grade (
	station_code INT NOT NULL,
	grade VARCHAR(1) NOT NULL,
	FOREIGN KEY(station_code) REFERENCES water_data(station_code),
	PRIMARY KEY(station_code)
);
--cannot use location/local as that is a key word for sql
--cannot use state as that is a keyword for sql
CREATE TABLE area (
	station_code INT NOT NULL,
	areas VARCHAR(200) NOT NULL,
	region VARCHAR(40) NOT NULL,
	lat FLOAT NOT NULL,
	lng FLOAT NOT NULL,
	FOREIGN KEY(station_code) REFERENCES water_data(station_code),
	PRIMARY KEY(station_code)
);
CREATE TABLE contents(
	station_code INT NOT NULL,
	dis_oxy FLOAT NOT NULL,
	ph FLOAT NOT NULL,
	conduct FLOAT NOT NULL,
	bod FLOAT NOT NULL,
	nit FLOAT NOT NULL,
	total_coli FLOAT NOT NULL,
	FOREIGN KEY(station_code) REFERENCES water_data(station_code),
	PRIMARY KEY(station_code)
);