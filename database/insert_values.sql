-- Inserting 10 pincodes across major Indian cities
INSERT INTO pincode (pin_code, city, state) VALUES
('700001', 'Kolkata',   'West Bengal'),
('700016', 'Kolkata',   'West Bengal'),
('700091', 'Kolkata',   'West Bengal'),
('110001', 'New Delhi', 'Delhi'),
('110092', 'New Delhi', 'Delhi'),
('400001', 'Mumbai',    'Maharashtra'),
('400069', 'Mumbai',    'Maharashtra'),
('560001', 'Bangalore', 'Karnataka'),
('600001', 'Chennai',   'Tamil Nadu'),
('500001', 'Hyderabad', 'Telangana');

-- Inserting 10 car models with varying fuel types, seating and pricing
INSERT INTO car_model (model, seats, ac, fuel_type, base_price) VALUES
('Alto K10',       5, FALSE, 'Petrol',   1500.00),
('Maruti Swift',   5, TRUE,  'Petrol',   2500.00),
('Hyundai i20',    5, TRUE,  'Petrol',   2800.00),
('Tata Nexon',     5, TRUE,  'Petrol',   3200.00),
('Honda City',     5, TRUE,  'Petrol',   3500.00),
('Hyundai Creta',  5, TRUE,  'Diesel',   4000.00),
('Kia Seltos',     5, TRUE,  'Petrol',   4200.00),
('Maruti Ertiga',  7, TRUE,  'CNG',      3800.00),
('Innova Crysta',  7, TRUE,  'Diesel',   4500.00),
('Nexon EV',       5, TRUE,  'Electric', 4800.00);

-- Inserting 1 company owner and 9 private owners with location details
INSERT INTO car_owner (name, phone, aadhaar_no, pin_code, street) VALUES
('RentEase Pvt Ltd', '9800000001', NULL,           '700001', '1 Dalhousie Square'),
('Rajesh Kumar',     '9831012345', '234567890123', '110001', '52 Rajpath Marg'),
('Priya Sharma',     '9820056789', '345678901234', '400001', '17 Nariman Point'),
('Arjun Nair',       '9845098765', '456789012345', '560001', '9 Indiranagar 100 Feet Road'),
('Sunita Verma',     '9876543210', '567890123456', '110092', '24 Lajpat Nagar Road'),
('Mohammed Irfan',   '9444011234', '678901234567', '600001', '6 Anna Salai'),
('Deepika Reddy',    '9700045678', '789012345678', '500001', '30 Banjara Hills Road'),
('Amit Banerjee',    '9830078901', '890123456789', '700016', '13 Rashbehari Avenue'),
('Kavitha Menon',    '9847023456', '901234567890', '400069', '41 Linking Road'),
('Suresh Patel',     '9898056789', '012345678901', '700091', '7 Gariahat Road');

-- Inserting 10 cars with registration numbers linked to owners and models
INSERT INTO car (registration_no, model, availability_status, base_price, owner_id) VALUES
('WB01AB1234', 'Alto K10',      TRUE,  1500.00, 1),
('WB01CD5678', 'Maruti Swift',  TRUE,  2500.00, 1),
('DL01EF9012', 'Hyundai i20',   FALSE, 2900.00, 2),
('MH01GH3456', 'Tata Nexon',    TRUE,  3200.00, 3),
('WB02IJ7890', 'Honda City',    TRUE,  3500.00, 1),
('KA01KL1234', 'Hyundai Creta', FALSE, 4100.00, 4),
('DL02MN5678', 'Kia Seltos',    TRUE,  4200.00, 5),
('WB03OP9012', 'Maruti Ertiga', TRUE,  3800.00, 1),
('TN01QR3456', 'Innova Crysta', TRUE,  4600.00, 6),
('TS01ST7890', 'Nexon EV',      TRUE,  4800.00, 7);


-- Inserting 10 customers with contact details and city-mapped addresses
INSERT INTO customer (name, email, phone_no, adhaar, pin_code,street) VALUES
('Aarav Sharma',    'aarav.sharma@gmail.com',    '9831011111', '111122223333', '700001', '14 Park Street' ),
('Priya Iyer', 'priya.iyer@gmail.com',      '9820022222', '222233334444', '600001','7 Anna Salai' ),
('Rohan Mehta', 'rohan.mehta@yahoo.com',     '9845033333', '333344445555', '400001','22 Marine Drive' ),
('Sneha Banerjee',  'sneha.banerjee@gmail.com',  '9876044444', '444455556666', '700016', '5 Rashbehari Avenue' ),
('Karan Nair', 'karan.nair@outlook.com',    '9444055555', '555566667777', '560001','31 MG Road'),
('Meera Reddy', 'meera.reddy@gmail.com',     '9700066666', '666677778888', '500001','18 Banjara Hills Road' ),
('Aditya Verma',    'aditya.verma@gmail.com',    '9830077777', '777788889999', '110001', '9 Connaught Place'),
('Divya Patel', 'divya.patel@yahoo.com',     '9847088888', '888899990000', '400069','45 Linking Road' ),
('Arjun Das','arjun.das@gmail.com',       '9898099999', '999900001111', '110092','3 Lajpat Nagar Road'),
('Pooja Pillai', 'pooja.pillai@outlook.com',  '9831010000', '000011112222', '700091','11 Gariahat Road');

-- Inserting 10 drivers with experience, status and city-mapped addresses
INSERT INTO driver (name, email, phone_no, aadhaar, experience, status, pin_code, street) VALUES
('Ramesh Mondal',  'ramesh.mondal@gmail.com',  '9831021111', '112233445566', 8,  'AVAILABLE', '700001', '6 Rabindra sarani'),
('Sunil Thakur',   'sunil.thakur@gmail.com',   '9820032222', '223344556677', 5,  'AVAILABLE', '700016', '19 Lenin sarani'),
('Manoj Tiwari',   'manoj.tiwari@yahoo.com',   '9845043333', '334455667788', 12, 'BUSY',      '110001', '27 Rajpath Marg'),
('Deepak Chauhan', 'deepak.chauhan@gmail.com', '9876054444', '445566778899', 3,  'AVAILABLE', '400001', '33 S.V. Road'),
('Vikram Singh',   'vikram.singh@outlook.com', '9444065555', '556677889900', 7,  'ON_LEAVE',  '560001', '12 Brigade Road'),
('Ravi Kumar',     'ravi.kumar@gmail.com',     '9700076666', '667788990011', 10, 'AVAILABLE', '600001', '8 Nungambakkam High Road'),
('Ajay Mishra',    'ajay.mishra@gmail.com',    '9830087777', '778899001122', 2,  'AVAILABLE', '500001', '21 Jubilee Hills Road'),
('Sanjay Ghosh',   'sanjay.ghosh@yahoo.com',   '9847098888', '889900112233', 15, 'BUSY',      '700091', '4 Brahmasamaj road'),
('Pradeep Kumar',  'pradeep.kumar@gmail.com',  '9898009999', '990011223344', 6,  'AVAILABLE', '110092', '16 Karol Bagh Road'),
('Nitin Patil',    'nitin.patil@outlook.com',  '9831020000', '001122334455', 4,  'ON_LEAVE',  '400069', '38 Juhu Beach Road');

-- Inserting 10 bookings with self-drive and driver-assigned rentals
INSERT INTO booking (customer_id, driver_id, car_id, booking_date, pickup_date, return_date, area_radius) VALUES
(1,  NULL, 1,  '2024-10-01', '2024-10-05', '2024-10-07', 50),
(2,  1,    2,  '2024-10-02', '2024-10-08', '2024-10-10', 100),
(3,  NULL, 3,  '2024-10-03', '2024-10-11', '2024-10-13', 80),
(4,  2,    4,  '2024-10-05', '2024-10-14', '2024-10-16', 120),
(5,  NULL, 5,  '2024-10-07', '2024-10-16', '2024-10-18', 60),
(6,  3,    6,  '2024-10-09', '2024-10-18', '2024-10-21', 150),
(7,  NULL, 7,  '2024-10-11', '2024-10-20', '2024-10-22', 90),
(8,  4,    8,  '2024-10-13', '2024-10-22', '2024-10-25', 110),
(9,  NULL, 1,  '2024-10-16', '2024-10-26', '2024-10-28', 70),
(10, 6,    9,  '2024-10-18', '2024-10-28', '2024-10-31', 130);

-- Inserting 10 payment records with mixed methods and statuses
INSERT INTO payment (booking_id, payment_date, amount, payment_method, payment_status) VALUES
(1,  '2024-10-01 10:30:00', 3000.00, 'UPI',         TRUE),
(2,  '2024-10-02 11:15:00', 5000.00, 'CARD',        TRUE),
(3,  '2024-10-03 09:45:00', 2800.00, 'NET_BANKING', TRUE),
(4,  '2024-10-05 14:00:00', 6400.00, 'UPI',         TRUE),
(5,  '2024-10-07 16:30:00', 3500.00, 'CASH',        TRUE),
(6,  '2024-10-09 10:00:00', 9000.00, 'CARD',        TRUE),
(7,  '2024-10-11 13:20:00', 4200.00, 'UPI',         FALSE),
(8,  '2024-10-13 15:45:00', 7600.00, 'NET_BANKING', TRUE),
(9,  '2024-10-16 11:00:00', 3000.00, 'CASH',        FALSE),
(10, '2024-10-18 09:30:00', 9200.00, 'UPI',         TRUE);
