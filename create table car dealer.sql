CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(200),
	address VARCHAR(250),
	billing_info VARCHAR(150)
);

CREATE TABLE salesperson(
	salesperson_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(200)
	
);

CREATE TABLE cars(
	car_vin SERIAL PRIMARY KEY,
	make VARCHAR(150),
	model VARCHAR(150),
	year INTEGER
	
);


create table invoice(
	invoice_id SERIAL primary key,
	customer_id INTEGER NOT NULL,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
	salesperson_id INTEGER NOT NULL,
	FOREIGN KEY(salesperson_id) REFERENCES salesperson(salesperson_id),
	car_vin INTEGER NOT NULL,
	FOREIGN KEY(car_vin) REFERENCES cars(car_vin)
	
);

CREATE TABLE parts(
	part_id SERIAL PRIMARY KEY,
	part_name VARCHAR(250),
	part_cost DECIMAL(6,2)

);

create table service_staff(
	mechanic_id SERIAL primary key,
	first_name VARCHAR(100),
	last_name VARCHAR(200),
	car_vin INTEGER NOT NULL,
	FOREIGN KEY(car_vin) REFERENCES cars(car_vin)
	
);

create table service_ticket(
	ticket_id SERIAL primary key,
	problem VARCHAR(400),
	service_cost DECIMAL (6,2),
	customer_id INTEGER NOT NULL,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
	mechanic_id INTEGER NOT NULL,
	FOREIGN KEY(mechanic_id) REFERENCES service_staff(mechanic_id),
	car_vin INTEGER NOT NULL,
	FOREIGN KEY(car_vin) REFERENCES cars(car_vin),
	part_id INTEGER NOT NULL,
	FOREIGN KEY(part_id) REFERENCES parts(part_id)
	
);

create table service_record(
	record_id SERIAL primary key,
	customer_id INTEGER NOT NULL,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
	mechanic_id INTEGER NOT NULL,
	FOREIGN KEY(mechanic_id) REFERENCES service_staff(mechanic_id),
	car_vin INTEGER NOT NULL,
	FOREIGN KEY(car_vin) REFERENCES cars(car_vin),
	ticket_id INTEGER NOT NULL,
	FOREIGN KEY(ticket_id) references service_ticket(ticket_id)

	
);






