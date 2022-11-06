INSERT INTO customer(
	customer_id,
	first_name,
	last_name,
	address,
	billing_info ) 
	values
	(
	1,
	'Lucy',
	'Grey',
	'123 My Street, Chicago, IL 60607',
	'1111-1111-1111-1111 555 02/29'
	),
	(
	2,
	'Max',
	'Amillion',
	'555 Hubbard St, Chicago, IL 60609',
	'1122-1331-1331-1331 222 04/28'
	);

insert INTO salesperson(
	salesperson_id,
	first_name,
	last_name)
	values (
	'101',
	'John',
	'Sales'
	),
	('102',
	'Pete',
	'Cannon'
	);

INSERT INTO cars(
	car_vin ,
	make ,
	model ,
	year)
	values (
	82930283,
	'Honda',
	'Civic',
	2022
	),
	(
	4435343230503809,
	'Mitsubishi',
	'Eclipse',
	1999
	);


insert INTO parts(
	part_id,
	part_name ,
	part_cost)
	values (
	222,
	'Brakes',
	100.25
	),
	(
	567,
	'Cabin Filter',
	34.99
	);


INSERT INTO service_staff(
	mechanic_id ,
	first_name ,
	last_name ,
	car_vin)
	values (
	55,
	'Bill',
	'Freeze',
	22342
	),
	(
	56,
	'Joe',
	'Lee',
	22342
	);

insert into service_ticket (
	ticket_id,
	problem,
	service_cost,
	customer_id,
	mechanic_id,
	car_vin,
	part_id

)
values (
	1000,
	'Replace brakes',
	'70.75',
	'1',
	'55',
	22342,
	222
	
),
	(1001,
	'Fix A/C',
	'200.55',
	'2',
	'56',
	55422,
	567 );


insert into service_record (
	record_id,
	customer_id,
	mechanic_id,
	car_vin,
	ticket_id

)
values (
	001,
	1,
	55,
	22342,
	1000
	
),
	(
	002,
	1,
	56,
	55422,
	1001);




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


create or replace function new_customer(_customer_id INTEGER, _first_name VARCHAR, _last_name VARCHAR, _address VARCHAR, _billing_info VARCHAR)
returns void
as $MAIN$
begin 	
	insert into customer(customer_id, first_name, last_name, address, billing_info)
	values(_customer_id, _first_name, _last_name,_address, _billing_info);
end;
$MAIN$
language plpgsql;


select new_customer(3, 'Tom', 'Cat', '44 Meow St, Catsville, CW 55404', '7777-5543-5554-3333 555 04/23')


create or replace function new_car(_car_vin INTEGER, _make VARCHAR, _model VARCHAR, _year INTEGER)
returns void
as $MAIN$
begin 	
	insert into cars(car_vin, make, model, year)
	values(_car_vin, _make, _model, _year);
end;
$MAIN$
language plpgsql;



select new_car (22342, 'Toyota', 'Camery', 2009)
select new_car (55422, 'Mercedes', 'SLK230', 1999)



