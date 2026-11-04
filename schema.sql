/**************************************** The CAR related schemas ******************************
CAR (car_id, model, brand, seats, ac, registration_no, fuel_type, status, base_price, owner_id)
*/

-- CAR (car_id, brand, registration_no, book_status, owner_id)
create table car(
    car_id integer primary key,
    registration_no unique not null, 
    brand varchar,
    -- model varchar, if it is not here how to make foreign key?
    seats integer,
    ac boolean,
    fuel_type varchar,
    book_status boolean,
    base_price double,
    owner_id integer,
)

-- CAR_MODEL (model, brand, seats, ac, fuel_type, base_price)
create table car_model(
    brand varchar,
    model varchar,
    seats integer,
    ac boolean,
    fuel_type varchar,
    base_price double,
    primary key(brand,model)    
)
-- what to do with {brand --> model} FD?



/**************************************** The USER related schemas ******************************
CUSTOMER (customer_id, name, email, phone_no, aadhaar, house_no, street, city, state, pin_code)
OWNER (owner_id, name, phone, aadhaar_no, owner_type, house_no, street, city, state, pin_code)
DRIVER (driver_id, name, email, phone_no, aadhaar, experience, status, house_no, street, city, state, pin_code)
*/

-- CUSTOMER (customer_id, name, email, phone_no, aadhaar, house_no, street, pin_code)
create table customer(
    customer_id integer primary key,
    name varchar,
    email varchar unique not null,
    phone_no varchar unique not null,
    aadhar varchar unique not null,
    street varchar, -- street should be in pincode right ??
    house_no integer, -- also this
    pin_code varchar,
    foreign key(pin_code) references pincode(pin_code),
)

-- PINCODE (pin_code, city, state)
-- or name it ADDRESS relation...
-- for pincode we need a single table right?
create table pincode(
    pin_code varchar primary key,
    -- street varchar, ??
    city varchar,
    state_place varchar,
)

-- OWNER (owner_id, name, phone, aadhaar_no, owner_type, house_no, street, pin_code)
create table owner(
    owner_id integer primary key,
    name varchar,
    email varchar unique not null,
    phone_no varchar unique not null,
    aadhar varchar unique not null,
    street varchar, -- street should be in pincode right ??
    house_no integer, -- also this
    pin_code varchar,
    foreign key(pin_code) references pincode(pin_code),
)

-- PINCODE (pin_code, city, state) -- already created.


-- DRIVER (driver_id, name, email, phone_no, aadhaar, experience, status, house_no, street, pin_code)
create table driver(
    driver_id integer primary key,
    name varchar,
    email varchar unique not null,
    phone_no varchar unique not null,
    aadhar varchar unique not null,
    experience varchar not null,
    street varchar, -- street should be in pincode right ??
    house_no integer, -- also this
    pin_code varchar,
    foreign key(pin_code) references pincode(pin_code),
)

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
)


/**************************************** The PAYMENT relation schemas ******************************
PAYMENT (payment_id, booking_id, payment_date, amount, payment_method, payment_status)
*/

create table payment(
    payment_id integer primary key,
    booking_id integer not null,
    payment_date date,
    payment_method varchar,
    payment_status boolean,
)

