-- PIN CODE TABLE
-- Stores pincode, city and state for address resolution

CREATE TABLE pincode (
    pin_code VARCHAR(6) PRIMARY KEY,
    city VARCHAR(50),
    state VARCHAR(20)
)

-- OWNER TABLE
-- Stores company and private car owner details
CREATE TABLE car_owner (
    owner_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    phone VARCHAR(10) UNIQUE NOT NULL,
    aadhaar_no VARCHAR(12) UNIQUE,
    pin_code VARCHAR(6),
    street VARCHAR(50),
    FOREIGN KEY (pin_code) REFERENCES pincode(pin_code)
);

-- CAR_MODEL TABLE
-- Stores car model details including seating, AC, fuel type and base price
CREATE TABLE car_model (
    model VARCHAR(50) PRIMARY KEY NOT NULL,
    seats INTEGER NOT NULL,
    ac BOOLEAN NOT NULL,
    fuel_type VARCHAR(50),
    base_price NUMERIC(8,2) NOT NULL
);

-- CAR TABLE
-- Stores individual car details linked to a model and owner

CREATE TABLE car (
    car_id SERIAL PRIMARY KEY,
    registration_no VARCHAR(15) UNIQUE NOT NULL,
    model VARCHAR(50) NOT NULL,
    availability_status BOOLEAN DEFAULT TRUE,
    base_price NUMERIC(10,2),
    owner_id INTEGER NOT NULL,

    FOREIGN KEY (model) REFERENCES car_model(model),
    FOREIGN KEY (owner_id) REFERENCES car_owner(owner_id)
);

-- CUSTOMER TABLE
-- Stores customer personal and contact details

CREATE TABLE customer (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    phone_no CHAR(10) UNIQUE NOT NULL,
    adhaar CHAR(12) UNIQUE NOT NULL,
    pin_code VARCHAR(6) NOT NULL,
    street VARCHAR(50),
    FOREIGN KEY (pin_code) REFERENCES pincode (pin_code)
);

-- DRIVER TABLE
-- Stores driver details including experience, availability status and location

CREATE TABLE driver (
    driver_id SERIAL  PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    phone_no VARCHAR(10) UNIQUE NOT NULL,
    aadhaar VARCHAR(12) UNIQUE NOT NULL,
    experience INTEGER NOT NULL CHECK (experience >= 0),
    status VARCHAR(20),
    pin_code VARCHAR(6),
    street VARCHAR(50),
    FOREIGN KEY (pin_code) REFERENCES pincode(pin_code)
);


-- BOOKING TABLE
-- Stores rental booking details linking customer, car and optional driver

CREATE TABLE booking (
    booking_id SERIAL  PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    driver_id INTEGER,
    car_id INTEGER NOT NULL,
    booking_date DATE NOT NULL,
    pickup_date DATE NOT NULL,
    return_date DATE NOT NULL,
    area_radius DOUBLE PRECISION,

    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (driver_id) REFERENCES driver(driver_id),
    FOREIGN KEY (car_id) REFERENCES car(car_id),

    CHECK (return_date > pickup_date)
);

-- PAYMENT TABLE
-- Stores payment transactions linked to a booking

CREATE TABLE payment (
    payment_id SERIAL PRIMARY KEY,
    booking_id INTEGER NOT NULL,
    payment_date TIMESTAMP NOT NULL,
    amount NUMERIC(8,2) NOT NULL CHECK (amount > 0),
    payment_method VARCHAR(30) NOT NULL,
    payment_status BOOLEAN DEFAULT FALSE,

    FOREIGN KEY (booking_id) REFERENCES booking(booking_id)
);


