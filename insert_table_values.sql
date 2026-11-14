-- PINCODE
insert into
    pincode (pin_code, city, state_place)
values
    ('560001', 'Bengaluru', 'Karnataka'),
    ('110001', 'New Delhi', 'Delhi'),
    ('400001', 'Mumbai', 'Maharashtra'),
    ('700001', 'Kolkata', 'West Bengal');


-- CAR_MODEL
insert into
    car_model (brand, seats, ac, fuel_type, base_price)
values
    ('Toyota', 5, true, 'Petrol', 2500.00),
    ('Hyundai', 5, true, 'Diesel', 2200.00),
    ('Tata', 7, true, 'Diesel', 2800.00),
    ('Maruti', 4, false, 'Petrol', 1800.00);


-- OWNER
insert into
    owner (owner_id, name, email, phone_no, aadhar, street, pin_code)
values
    (1, 'A', 'a@example.com', '9876543210', '111122223333', 'MG Road', '560001'),
    (2, 'B', 'b@example.com', '9876543211', '222233334444', 'Connaught Place', '110001'),
    (3, 'C', 'c@example.com', '9876543212', '333344445555', 'Marine Drive', '400001');


-- CUSTOMER
insert into
    customer (customer_id, name, email, phone_no, aadhar, street, pin_code)
values
    (1, 'c1', 'c1@example.com', '9000000001', '444455556666', 'Indiranagar', '560001'),
    (2, 'c2', 'c2@example.com', '9000000002', '555566667777', 'Salt Lake', '700001'),
    (3, 'c3', 'c3@example.com', '9000000003', '666677778888', 'Lajpat Nagar', '110001');


-- DRIVER
insert into
    driver (driver_id, name, email, phone_no, aadhar, experience, street, pin_code)
values
    (1, 'driver 1', 'd1@example.com', '9100000001', '777788889999', '5 years', 'Koramangala', '560001'),
    (2, 'driver 2', 'd2@example.com', '9100000002', '888899990000', '3 years', 'Andheri West', '400001'),
    (3, 'driver 3', 'd3@example.com', '9100000003', '999900001111', '7 years', 'Dwarka', '110001');


-- CAR
insert into
    car (car_id, registration_no, brand, book_status, owner_id)
values
    (1, 'KA01AB1234', 'Toyota', 0, 1),
    (2, 'DL01CD5678', 'Hyundai', 1, 2),
    (3, 'MH01EF9012', 'Tata', 0, 3),
    (4, 'WB01GH3456', 'Maruti', 1, 1);


-- BOOKING
insert into
    booking (booking_id, customer_id, driver_id, car_id, booking_date, pickup_date, return_date, area_radius)
values
    (1, 1, 1, 1, '2026-11-01', '2026-11-02', '2026-11-05', 15.5),
    (2, 2, 2, 2, '2026-11-03', '2026-11-04', '2026-11-06', 20.0),
    (3, 3, 3, 3, '2026-11-05', '2026-11-06', '2026-11-10', 12.0);


-- PAYMENT
insert into
    payment (payment_id, booking_id, payment_date, payment_method, payment_status)
values
    (1, 1, '2026-11-01', 'UPI', 1),
    (2, 2, '2026-11-03', 'Card', 1),
    (3, 3, '2026-11-05', 'Cash', 0);