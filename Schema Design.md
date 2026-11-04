# Relational Schema Design & Normalization Analysis

Car Rental System

---

## **CUSTOMER Relation**

CUSTOMER (customer\_id, name, email, phone\_no, aadhaar, house\_no, street, city, state, pin\_code)

- **customer\_id:** PRIMARY KEY  
- **email**, **phone\_no**, **aadhaar:** UNIQUE, NOT NULL  
- **house\_no, street, city, state, pin\_code:** Address attributes

### Candidate Keys

- **Candidate Keys:** {customer\_id}, {aadhaar}, {email}, {phone\_no}

### Functional Dependencies (FDs)

- customer\_id → { name, email, phone\_no, aadhaar, house\_no, street, city, state, pin\_code }  
- aadhaar → { customer\_id, name, email, phone\_no, house\_no, street, city, state, pin\_code }  
- email → { customer\_id, name, phone\_no, aadhaar, house\_no, street, city, state, pin\_code }  
- phone\_no → { customer\_id, name, aadhaar, house\_no, street, city, state, pin\_code }  
- pin\_code → { city, state }

---

#### 1NF

This schema contains separate columns for house\_no, street, city, state, and pin\_code. Assuming each field contains one atomic value, this relation satisfies **1NF**.

#### 2NF

Every candidate key contains only one attribute.  
A single-attribute candidate key cannot have a proper subset that determines a non-prime attribute. Therefore, partial dependencies on candidate keys are impossible in this relation.  
Consequently, CUSTOMER relation satisfies **2NF**.

#### 3NF & Transitive Dependency

In this relation, pin\_code is not a candidate key, hence not a superkey.  
But pin\_code → { city, state }, where these are non-prime attributes.  
Therefore:

- customer\_id → pin\_code  
- pin\_code → city

Clearly, this is a **transitive dependency**.  
Separate the PIN-code information into its own relation.

### Decomposed Schema (to achieve 3NF & BCNF)

CUSTOMER (customer\_id, name, email, phone\_no, aadhaar, house\_no, street, pin\_code)

- pin\_code: FOREIGN KEY REFERENCES PINCODE(pin\_code)

PINCODE (pin\_code, city, state)

- pin\_code: PRIMARY KEY

### Verification of Decomposed Relations

- In CUSTOMER, each determinant shown above is a candidate key.  
- In PINCODE, pin\_code is the primary key.  
- Therefore, both relations satisfy **3NF**.  
- Here, for every functional dependency X → Y, X is a superkey. Therefore, every non-trivial FD in CUSTOMER has a superkey as its determinant.  
- CUSTOMER satisfies **BCNF**.  
- In PINCODE, pin\_code is the primary key and therefore a superkey.  
- PINCODE satisfies **BCNF**.

---

## DRIVER Relation

DRIVER (driver\_id, name, email, phone\_no, aadhaar, experience, status, house\_no, street, city, state, pin\_code)

- **driver\_id:** PRIMARY KEY  
- **email:** UNIQUE, NOT NULL  
- **phone\_no:** UNIQUE, NOT NULL

- **aadhaar:** UNIQUE, NOT NULL

### Candidate Keys

- **Candidate Keys:** {driver\_id}, {email}, {phone\_no}, {aadhaar}

### Functional Dependencies (FDs)

- driver\_id → { name, email, phone\_no, aadhaar, experience, status, house\_no, street, city, state, pin\_code }  
- aadhaar → { driver\_id, name, email, phone\_no, experience, status, house\_no, street, city, state, pin\_code }  
- email → { driver\_id, name, phone\_no, aadhaar, experience, status, house\_no, street, city, state, pin\_code }  
- phone\_no → { driver\_id, name, phone\_no, aadhaar, experience, status, house\_no, street, city, state, pin\_code }  
- pin\_code → { city, state }

---

#### 1NF

This schema contains separate columns for house\_no, street, city, state, and pin\_code. Assuming each field contains one atomic value, this relation satisfies **1NF**.

#### 2NF

Every candidate key contains only one attribute.  
A single-attribute candidate key cannot have a proper subset that determines a non-prime attribute. Therefore, partial dependencies on candidate keys are impossible in this relation.  
Consequently, DRIVER relation satisfies **2NF**, provided it satisfies 1NF.

#### 3NF & Transitive Dependency

In this relation, pin\_code is not a candidate key, hence not a superkey.  
Assuming pin\_code → { city, state }, city and state are not prime attributes.  
Therefore:

- driver\_id → pin\_code  
- Also, pin\_code → { city, state }

Clearly, this is a **transitive dependency**.  
Separate the PIN-code information into its own relation.

---

### Decomposed Schema (to achieve 3NF & BCNF)

DRIVER (driver\_id, name, email, phone\_no, aadhaar, experience, status, house\_no, street, pin\_code)

- **driver\_id:** PRIMARY KEY  
- **email:** UNIQUE, NOT NULL  
- **phone\_no:** UNIQUE, NOT NULL  
- **aadhaar:** UNIQUE, NOT NULL  
- pin\_code: FOREIGN KEY REFERENCES PINCODE(pin\_code)

PINCODE (pin\_code, city, state)

- pin\_code: PRIMARY KEY

### Verification of Decomposed Relations

- In DRIVER, the determinants driver\_id, email, phone\_no, and aadhaar are candidate keys.  
- In PINCODE, pin\_code is the primary key.  
- Therefore, both relations satisfy **3NF**.  
- Here, for every functional dependency X → Y, X is a superkey. Therefore, every non-trivial FD in DRIVER has a superkey as its determinant.  
- DRIVER satisfies **BCNF**.  
- In PINCODE, pin\_code is the primary key and therefore a superkey.  
- PINCODE satisfies **BCNF**.

---

## OWNER Relation

OWNER (owner\_id, name, phone, aadhaar\_no, owner\_type, house\_no, street, city, state, pin\_code)

- **owner\_id:** PRIMARY KEY  
- **phone:** UNIQUE

- **aadhaar\_no:** UNIQUE

### Candidate Keys

- owner\_id → { name, phone, aadhaar\_no, owner\_type, house\_no, street, city, state, pin\_code }  
- phone → { owner\_id, name, aadhaar\_no, owner\_type, house\_no, street, city, state, pin\_code }  
- pin\_code → { city, state }

>

- **Candidate Keys:** {owner\_id}, {phone}  
- **aadhaar\_no:** Not a candidate key because it is nullable, even though it is UNIQUE.

>

---

#### 1NF

OWNER satisfies **1NF** because all attributes contain atomic values, assuming each field stores only one value.

#### 2NF

OWNER satisfies **2NF** because both candidate keys (owner\_id and phone) are single attributes. Therefore, no partial dependencies exist.

#### 3NF & Transitive Dependency

OWNER does not satisfy **3NF**.  
pin\_code → { city, state }  
Here, pin\_code is not a superkey, and city and state are non-prime attributes. Therefore, a transitive dependency exists.  
OWNER does not satisfy 3NF.

---

Decomposed Schema (to achieve 3NF & BCNF)

OWNER (owner\_id, name, phone, aadhaar\_no, owner\_type, house\_no, street, pin\_code)

- **owner\_id:** PRIMARY KEY  
- **phone:** UNIQUE  
- **aadhaar\_no:** UNIQUE  
- pin\_code: FOREIGN KEY REFERENCES PINCODE(pin\_code)

PINCODE (pin\_code, city, state)

- pin\_code: PRIMARY KEY

### Verification of Decomposed Relations

Here:

- owner\_id and phone determine the other OWNER attributes.  
- pin\_code determines city and state in PINCODE.  
- Therefore, both decomposed relations satisfy **3NF** and **BCNF**, assuming no additional functional dependencies exist.

---

## CAR Relation

CAR (car\_id, model, brand, seats, ac, registration\_no, fuel\_type, status, base\_price, owner\_id)

- **car\_id:** PRIMARY KEY

- **registration\_no:** UNIQUE, NOT NULL

### Candidate Keys

- **Candidate Keys:** {car\_id}, {registration\_no}

### Functional Dependencies (FDs)

- car\_id → { model, brand, seats, ac, registration\_no, fuel\_type, status, base\_price, owner\_id }  
- registration\_no → { car\_id, model, brand, seats, ac, fuel\_type, status, base\_price, owner\_id }  
- { model, brand } → { seats, ac, fuel\_type, base\_price }  
- { brand } → { model }

#### 1NF

Assuming each attribute contains a single atomic value, CAR satisfies **1NF**.

#### 2NF

Every candidate key contains only one attribute.  
A single-attribute candidate key cannot have a proper subset that determines a non-prime attribute. Therefore, partial dependencies on candidate keys are impossible in this relation.  
Consequently, CAR satisfies **2NF**, provided it satisfies 1NF.

#### 3NF Violation

In this relation, { model, brand } is not a candidate key and, under the given FDs, is not a superkey.  
But:  
{ model, brand } → { seats, ac, fuel\_type, base\_price }  
These dependent attributes are non-prime attributes.  
Therefore, this functional dependency violates **3NF**.  
We apply decomposition here:

Decomposed Schema (to achieve 3NF & BCNF)

CAR (car\_id, brand, registration\_no, status, owner\_id)

- **car\_id:** PRIMARY KEY  
- brand: FOREIGN KEY REFERENCES CAR\_MODEL(brand)  
- **registration\_no:** UNIQUE, NOT NULL

CAR\_MODEL (model, brand, seats, ac, fuel\_type, base\_price)

- **PRIMARY KEY:** (model, brand)

### Verification of Decomposed Relations

- In the CAR\_MODEL relation, brand and model determine all the other attributes under the given FDs.  
- In CAR, car\_id and registration\_no are candidate keys.  
- Therefore, both relations satisfy **3NF**.  
- In CAR, car\_id and registration\_no are candidate keys. Every non-trivial FD has a candidate key as its determinant. CAR satisfies **BCNF**.  
- In CAR\_MODEL, { brand, model } is the primary key and determines all the other attributes. Therefore, every non-trivial FD in CAR\_MODEL has a superkey as its determinant. CAR\_MODEL satisfies **BCNF**.

---

## BOOKING Relation

The BOOKING schema has been derived from the BOOKS relation in the ER diagram.

BOOKING (booking\_id, customer\_id, driver\_id, car\_id, booking\_date, pickup\_date, return\_date, radius)

- **booking\_id:** PRIMARY KEY, NOT NULL  
- **customer\_id:** FOREIGN KEY, NOT NULL  
- **driver\_id:** FOREIGN KEY (NULLABLE)  
- **car\_id:** FOREIGN KEY, NOT NULL

### Foreign Keys Explanation

- **Foreign Keys:** customer\_id, driver\_id, car\_id  
- Since BOOKING represents a ternary relation and it connects CUSTOMER, DRIVER, and CAR entities, therefore we have { customer\_id, driver\_id, car\_id } as foreign keys with BOOKING relation.

### Functional Dependencies (FDs)

- booking\_id → { customer\_id, driver\_id, car\_id, booking\_date, pickup\_date, return\_date, radius }

> **Note:** Here, driver\_id is NULLABLE. If a customer can choose to self-drive, driver\_id must be optional.

#### 1NF

BOOKING satisfies **1NF** because all attributes contain atomic values.

#### 2NF

BOOKING satisfies **2NF** because booking\_id is a single-attribute candidate key. Therefore, no partial dependency exists.

#### 3NF

BOOKING satisfies **3NF**.  
booking\_id determines all the remaining attributes in the relation.  
Since booking\_id is a candidate key, every non-trivial FD has a candidate key as its determinant.  
BOOKING satisfies 3NF.

#### BCNF

BOOKING satisfies **BCNF** because booking\_id is a superkey and determines all other attributes.  
Every non-trivial FD has a superkey as its determinant.  
BOOKING satisfies BCNF.

## PAYMENT Relation

PAYMENT (payment\_id, booking\_id, payment\_date, amount, payment\_method, payment\_status)

- **payment\_id:** PRIMARY KEY, NOT NULL  
- **booking\_id:** FOREIGN KEY REFERENCES BOOKING(booking\_id), NOT NULL

### Keys & Functional Dependencies (FDs)

- **Primary Key:** payment\_id  
- **Foreign Key:** booking\_id (references BOOKING(booking\_id))

#### Functional Dependencies (FDs)

- payment\_id → { booking\_id, payment\_date, amount, payment\_method, payment\_status }

#### 1NF

PAYMENT satisfies **1NF** because all attributes contain atomic values.

#### 2NF

PAYMENT satisfies **2NF** because payment\_id is a single-attribute candidate key. Therefore, no partial dependency exists.

#### 3NF

PAYMENT satisfies **3NF**.  
payment\_id determines all the remaining attributes in the relation.  
Since payment\_id is a candidate key, every non-trivial FD has a candidate key as its determinant.  
PAYMENT satisfies 3NF.

#### BCNF

PAYMENT satisfies **BCNF** because payment\_id is a superkey and determines all other attributes.  
Every non-trivial FD has a superkey as its determinant.  
PAYMENT satisfies BCNF.  
