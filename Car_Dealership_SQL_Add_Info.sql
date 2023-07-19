-- ADDED FUNCTIONS 
-- add to class FUNCTION
CREATE FUNCTION addClass(
	_vehicle_class varchar
)
RETURNS VOID 
LANGUAGE plpgsql AS $$
	BEGIN 
		INSERT INTO "class"(
			vehicle_class
		)VALUES(
			_vehicle_class
		);
	END	
$$

SELECT addClass('big rig');
SELECT addClass('motorcycle');

SELECT *
FROM "class";
-- add to customer FUNCTION
CREATE FUNCTION addCustomer(
	_first_name varchar,
	_last_name varchar,
	_email varchar,
	_phone varchar,
	_address varchar
)
RETURNS VOID
LANGUAGE plpgsql AS $$
	BEGIN
		INSERT INTO "customer"(
			first_name,
			last_name,
			email,
			phone,
			address
		)VALUES(
			_first_name,
			_last_name,
			_email,
			_phone,
			_address
		);
	END
$$

SELECT addCustomer('joe', 'miller', 'joem@jm.com', '1236540987','123 W End St');

SELECT * 
FROM "customer";
-- Add data to tables
-- class
INSERT INTO "class"(
	vehicle_class
)VALUES(
	'micro'
),(
	'sedan'
),(
	'CUV'
),(
	'SUV'
),(
	'hatchback'
),(
	'roadster'
),(
	'pickup'
),(
	'van'
),(
	'coupe'
),(
	'supercar'
),(
	'campervan'
),(
	'minivan'
);
SELECT *
FROM "class";
-- customer
INSERT INTO "customer"(
	first_name,
	last_name,
	email,
	phone,
	address
)VALUES(
	'Benjamin',
	'Copen',
	'bcopen@dealership.com',
	'5466769982',
	'967 Heaney Well Apt. 960'
),(
	'Sean',
	'Curree',
	'scurree@dealership.com',
	'1234567890',
	'308 Negra Arroyo Lane'
),(
	'Maeve', 
	'Carter',
	'beatty.jabari@gmail.com',
	'14016220464',
	'Price Locks Apt. 647'
),(
	'Kathryn',
	'Ferry',
	'jody.cruickshank@gmail.com',
	'5263406608',
	'437 Creola Alley'
),(
	'Estevan',
	'Farrell',
	'schiller.percival@gmail.com',
	'4868066991',
	'290 Kasandra Stravenue'
);
SELECT *
FROM "customer";
-- employee
INSERT INTO "employee" (
	first_name,
	last_name,
	employee_type_id,
	email,
	starting_date,
	salary,
	phone
)VALUES(
	'Ricardo',
	'Dibbert',
	1,
	'goodwin.kathryn@dealership.com',
	current_date,
	300000,
	5828062404
),(
	'Elroy',
	'DuBuque',
	2,
	'uschumm@dealership.com',
	current_date,
	100000,
	6567106341
),(
	'Wilson',
	'Nitzsche',
	3,
	'henriette63@dealership.com',
	current_date,
	60000,
	2568494776
),(
	'Ramona',
	'Dach',
	4,
	'kcremin@dealership.com',
	current_date,
	65000,
	3213531845
),(
	'Margie',
	'Howe',
	5,
	'johan20@dealership.com',
	current_date,
	70000,
	3399461145
),(
	'Declan',
	'Mayer',
	6,
	'michaela.hilpert@dealership.com',
	current_date,
	50000,
	6959695878
),(
	'Evangeline',
	'Walker',
	7,
	'kschneider@dealership.com',
	current_date,
	37000,
	9562923392
),(
	'Sammie', 
	'Botsford',
	8,
	'bonita.hane@dealership.com',
	current_date,
	44000,
	8818686556
),(
	'Cordell', 
	'Kuhn',
	9,
	'msmitham@dealership.com',
	current_date,
	58000,
	5879651549
),(
	'Donny', 
	'Nikolaus',
	10,
	'erik.greenfelder@dealership.com',
	current_date,
	60000,
	7704958429
),(
	'Jayden', 
	'Ritchie',
	11,
	'minerva43@dealership.com',
	current_date,
	25000,
	458127010
),(
	'Woodrow', 
	'Padberg',
	12,
	'josie.kiehn@dealership.com',
	current_date,
	25000,
	5758917946
);
SELECT *
FROM employee;
-- employee_type
INSERT INTO "employee_type"(
	"position",
	employee_manager
)VALUES(
	'CEO',
	NULL
),(
	'General Manager',
	1
),(
	'HR lead',
	2
),(
	'salesman lead',
	2
),(
	'mechanic lead',
	2
),(
	'logistics lead',
	2
),(
	'detail lead',
	2
),(
	'HR',
	3
),(
	'salesman',
	4
),(
	'mechanic',
	5
),(
	'logistics',
	6
),(
	'detail',
	7
);
SELECT *
FROM employee_type;
-- invoice
INSERT INTO "invoice"(
	vehicle_id,
	customer_id,
	total_price,
	license_no,
	policy_no,
	employee_id
)VALUES(
	3,
	1,
	4000,
	'Y67327166',
	'53600086',
	4
),(
	4,
	1,
	40000,
	'Y67327166',
	'99228625',
	9
);
SELECT *
FROM invoice;
-- mechanic_list
INSERT INTO "mechanic_list"(
	mechanic_list_id,
	employee_id
)VALUES(
	1,
	5
),(
	2,
	10
),(
	3,
	10
);
SELECT *
FROM mechanic_list;
-- service_ticket
INSERT INTO "service_ticket"(
	serial_no_id,
	customer_id,
	service_cost,
	service_type_id,
	description
)VALUES(
	'WAULFAFR3DA006959',
	2,
	NULL,
	1,
	'Oil changed at 56374 miles'
),(
	'5XYZUDLB7DG006717',
	4,
	40,
	1,
	'Oil changed at 74356 miles'
),(
	'5XYZUDLB7DG006717',
	4,
	300,
	7,
	'Front tires changed at 76111 miles'
);
SELECT *
FROM service_ticket;
-- service_type
INSERT INTO "service_type"(
	service_type
)VALUES(
	'oil check'
),(
	'alignment'
),(
	'filter replacement'
),(
	'transmission'
),(
	'engine'
),(
	'brakes'
),(
	'tires'
),(
	'battery'
),(
	'muffler'
),(
	'body work'
),(
	'AC/Heating'
),(
	'muffler'
),(
	'other'
); 
SELECT *
FROM service_type;
-- vehicle
INSERT INTO "vehicle"(
	customer_id,
	make,
	model,
	"year",
	class_id,
	color,
	serial_no_id,
	mileage
)VALUES(
	NULL,
	'Acura',
	'Legend',
	1990,
	9,
	'white',
	'JH4KA4530LC018693',
	86000
),(
	2,
	'Audi',
	'A5',
	2013,
	2,
	'silver',
	'WAULFAFR3DA006959',
	56374
),(
	1,
	'Honda',
	'Accord',
	2002,
	2,
	'red',
	'JHMCG56492C003897',
	267469
),(
	1,
	'Acura',
	'NSX',
	1994,
	10,
	'purple',
	'JH4NA1261RT000013',
	78501
),(
	NULL,
	'Volkswagen',
	'Rabbit',
	2008,
	5,
	'blue',
	'WVWAA71K08W201030',
	0
),(
	4,
	'Hyundai',
	'Santa Fe Sport',
	2013,
	4,
	'grey',
	'5XYZUDLB7DG006717',
	76111
);
SELECT *
FROM "vehicle";
-- vehicles_for_sale
INSERT INTO "vehicles_for_sale"(
	vehicle_status,
	vehicle_id,
	pricing,
	pricing_per_month
)VALUES(
	'Used',
	1,
	7400,
	200
),(
	'New',
	5,
	18600,
	285
); 
SELECT *
FROM "vehicles_for_sale";