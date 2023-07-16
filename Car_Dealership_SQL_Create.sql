CREATE TABLE "class"(
    "class_id" SERIAL NOT NULL,
    "vehicle_class" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "class" ADD PRIMARY KEY("class_id");
CREATE TABLE "mechanic_list"(
    "mechanic_list_id" INTEGER NOT NULL,
    "employee_id" INTEGER NOT NULL
);
ALTER TABLE
    "mechanic_list" ADD PRIMARY KEY("mechanic_list_id");
CREATE TABLE "vehicles_for_sale"(
    "vehicles_for_sale_id" SERIAL NOT NULL,
    "vehicle_status" VARCHAR(255) NOT NULL,
    "vehicle_id" INTEGER NOT NULL,
    "pricing" DECIMAL(8, 2) NOT NULL,
    "pricing_per_month" DECIMAL(8, 2) NULL
);
ALTER TABLE
    "vehicles_for_sale" ADD PRIMARY KEY("vehicles_for_sale_id");
CREATE TABLE "employee_type"(
    "employee_type_id" SERIAL NOT NULL,
    "position" VARCHAR(255) NOT NULL,
    "employee_manager" INTEGER NULL
);
ALTER TABLE
    "employee_type" ADD PRIMARY KEY("employee_type_id");
CREATE TABLE "service_type"(
    "service_type_id" SERIAL NOT NULL,
    "service_type" VARCHAR(255) NOT NULL,
    "description" VARCHAR(255) NULL
);
ALTER TABLE
    "service_type" ADD PRIMARY KEY("service_type_id");
CREATE TABLE "invoice"(
    "invoice_id" SERIAL NOT NULL,
    "vehicle_id" BIGINT NOT NULL,
    "customer_id" INTEGER NOT NULL,
    "total_price" DECIMAL(8, 2) NOT NULL,
    "license_no" VARCHAR(255) NULL,
    "policy_no" INTEGER NULL,
    "employee_id" INTEGER NOT NULL,
    "description" VARCHAR(255) NULL
);
ALTER TABLE
    "invoice" ADD PRIMARY KEY("invoice_id");
CREATE TABLE "employee"(
    "employee_id" SERIAL NOT NULL,
    "first_name" VARCHAR(255) NOT NULL,
    "last_name" VARCHAR(255) NOT NULL,
    "employee_type_id" INTEGER NOT NULL,
    "email" VARCHAR(255) NOT NULL,
    "phone" VARCHAR NOT NULL,
    "starting_date" DATE NOT NULL,
    "salary" DECIMAL(8, 2) NULL
);

ALTER TABLE
    "employee" ADD PRIMARY KEY("employee_id");
CREATE TABLE "service_ticket"(
    "service_ticket_id" SERIAL NOT NULL,
    "serial_no_id" VARCHAR NOT NULL,
    "customer_id" INTEGER NOT NULL,
    "service_cost" DECIMAL(8, 2) NULL,
    "service_type_id" INTEGER NOT NULL,
    "mechanic_list_id" SERIAL NOT NULL,
    "description" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "service_ticket" ADD PRIMARY KEY("service_ticket_id");
CREATE TABLE "vehicle"(
    "vehicle_id" SERIAL NOT NULL,
    "customer_id" INTEGER NULL,
    "make" VARCHAR(255) NOT NULL,
    "model" VARCHAR(255) NOT NULL,
    "year" INTEGER NOT NULL,
    "class_id" INTEGER NOT NULL,
    "color" VARCHAR(255) NULL,
    "serial_no_id" VARCHAR(255) NOT NULL,
    "mileage" BIGINT NOT NULL
);
ALTER TABLE
    "vehicle" ADD PRIMARY KEY("vehicle_id");
ALTER TABLE
    "vehicle" ADD UNIQUE KEY("serial_no_id");
CREATE TABLE "customer"(
    "customer_id" SERIAL NOT NULL,
    "first_name" VARCHAR(255) NOT NULL,
    "last_name" VARCHAR(255) NOT NULL,
    "email" VARCHAR(255) NOT NULL,
    "phone" VARCHAR(255) NOT NULL,
    "address" VARCHAR(255) NULL
);
ALTER TABLE
    "customer" ADD PRIMARY KEY("customer_id");
ALTER TABLE
    "vehicle" ADD CONSTRAINT "vehicle_class_id_foreign" FOREIGN KEY("class_id") REFERENCES "class"("class_id");
ALTER TABLE
    "vehicle" ADD CONSTRAINT "customer_id_foreign" FOREIGN KEY("customer_id") REFERENCES "customer"("customer_id");
ALTER TABLE
    "invoice" ADD CONSTRAINT "invoice_employee_id_foreign" FOREIGN KEY("employee_id") REFERENCES "employee"("employee_id");
ALTER TABLE
    "service_ticket" ADD CONSTRAINT "service_ticket_customer_id_foreign" FOREIGN KEY("customer_id") REFERENCES "customer"("customer_id");
ALTER TABLE
    "service_ticket" ADD CONSTRAINT "service_ticket_serial_no_id_foreign" FOREIGN KEY("serial_no_id") REFERENCES "vehicle"("serial_no_id");
ALTER TABLE
    "vehicles_for_sale" ADD CONSTRAINT "vehicles_for_sale_vehicle_id_foreign" FOREIGN KEY("vehicle_id") REFERENCES "vehicle"("vehicle_id");
ALTER TABLE
    "invoice" ADD CONSTRAINT "invoice_customer_id_foreign" FOREIGN KEY("customer_id") REFERENCES "customer"("customer_id");
ALTER TABLE
    "employee_type" ADD CONSTRAINT "employee_type_employee_manager_foreign" FOREIGN KEY("employee_manager") REFERENCES "employee_type"("employee_type_id");
ALTER TABLE
    "mechanic_list" ADD CONSTRAINT "mechanic_list_employee_id_foreign" FOREIGN KEY("employee_id") REFERENCES "employee"("employee_id");
ALTER TABLE
    "invoice" ADD CONSTRAINT "invoice_vehicle_id_foreign" FOREIGN KEY("vehicle_id") REFERENCES "vehicle"("vehicle_id");
ALTER TABLE
    "service_ticket" ADD CONSTRAINT "service_ticket_mechanic_list_id_foreign" FOREIGN KEY("mechanic_list_id") REFERENCES "mechanic_list"("mechanic_list_id");
ALTER TABLE
    "employee" ADD CONSTRAINT "employee_employee_type_id_foreign" FOREIGN KEY("employee_type_id") REFERENCES "employee_type"("employee_type_id");
ALTER TABLE
    "service_ticket" ADD CONSTRAINT "service_ticket_service_type_id_foreign" FOREIGN KEY("service_type_id") REFERENCES "service_type"("service_type_id");