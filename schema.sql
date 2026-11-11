/**************************************** The CAR related schemas ******************************
CAR (car_id, model, brand, seats, ac, registration_no, fuel_type, status, base_price, owner_id)
*/

-- CAR (car_id, brand, registration_no, book_status, owner_id)
create table car(
    car_id integer primary key,
    registration_no unique not null,
    brand varchar(50),
    seats integer,
    ac boolean,
    fuel_type varchar(50),
    book_status boolean,
    base_price double(7,2),
    owner_id integer
);

-- CAR_MODEL (model, brand, seats, ac, fuel_type, base_price)
create table car_model(
    brand varchar(50),
    model varchar(50),
    seats integer,
    ac boolean,
    fuel_type varchar(50),
    base_price double,
    primary key(brand,model)
);
-- what to do with {brand --> model} FD?



/**************************************** The USER related schemas ******************************
CUSTOMER (customer_id, name, email, phone_no, aadhaar, street, city, state, pin_code)
OWNER (owner_id, name, phone, aadhaar_no, owner_type, street, city, state, pin_code)
DRIVER (driver_id, name, email, phone_no, aadhaar, experience, status, street, city, state, pin_code)
*/

-- PINCODE (pin_code, city, state)
create table pincode(
    pin_code varchar(50) primary key,
    city varchar(50),
    state_place varchar(50)
);


-- CUSTOMER (customer_id, name, email, phone_no, aadhaar, street, pin_code)
create table customer(
    customer_id integer primary key,
    name varchar(50),
    email varchar(50) unique not null,
    phone_no varchar(50) unique not null,
    aadhar varchar(50) unique not null,
    street varchar(50), -- street should be in pincode right ??
    pin_code varchar(50),
    foreign key(pin_code) references pincode(pin_code)
);


-- OWNER (owner_id, name, phone, aadhaar_no, owner_type, street, pin_code)
create table owner(
    owner_id integer primary key,
    name varchar(50),
    email varchar(50) unique not null,
    phone_no varchar(50) unique not null,
    aadhar varchar(50) unique not null,
    street varchar(50), -- street should be in pincode right ??
    pin_code varchar(50),
    foreign key(pin_code) references pincode(pin_code)
);

-- PINCODE (pin_code, city, state) -- already created.


-- DRIVER (driver_id, name, email, phone_no, aadhaar, experience, status, street, pin_code)
create table driver(
    driver_id integer primary key,
    name varchar(50),
    email varchar(50) unique not null,
    phone_no varchar(50) unique not null,
    aadhar varchar(50) unique not null,
    experience varchar(50) not null,
    street varchar(50),
    pin_code varchar(50),
    foreign key(pin_code) references pincode(pin_code)
);

-- PINCODE (pin_code, city, state) -- already created


/**************************************** The BOOKING relation schemas ******************************
BOOKING (booking_id, customer_id, driver_id, car_id, booking_date, pickup_date, return_date, radius)
*/

create table booking(
    booking_id integer primary key,
    customer_id integer not null,
    driver_id integer not null,
    car_id integer not null,
    booking_date data,
    pickup_date date,
    return_date date,
    area_radius double,
    foreign key(customer_id) references customer(customer_id),
    foreign key(driver_id) references driver(driver_id),
    foreign key(car_id) references car(car_id)
);


/**************************************** The PAYMENT relation schemas ******************************
PAYMENT (payment_id, booking_id, payment_date, amount, payment_method, payment_status)
*/

create table payment(
    payment_id integer primary key,
    booking_id integer not null,
    payment_date date,
    payment_method varchar(50),
    payment_status boolean,
    foreign key(booking_id) references booking(booking_id)
);