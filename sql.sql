create database blood_bank;
use blood_bank;
-- drop database blood_bank;
-- Donors Table
CREATE TABLE Donors (
    donor_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    age INT CHECK (age >= 18),
    gender ENUM('Male', 'Female', 'Other') NOT NULL,
    blood_type ENUM('A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-') NOT NULL,
    contact_number VARCHAR(15),
    address VARCHAR(255),
    last_donation_date DATE
);

/*Recipients Database*/
CREATE TABLE Recipients (
    recipient_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    age INT,
    gender ENUM('Male', 'Female', 'Other') NOT NULL,
    blood_type ENUM('A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-') NOT NULL,
    contact_number VARCHAR(15),
    address VARCHAR(255),
    hospital_name VARCHAR(100)
);

-- Blood Bank

CREATE TABLE BloodBank (
    bloodbank_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(255),
    contact_number VARCHAR(15),
    email VARCHAR(50)
);

-- Donations Tables
CREATE TABLE Donations (
    donation_id INT PRIMARY KEY AUTO_INCREMENT,
    donor_id INT,
    bloodbank_id INT,
    donation_date DATE NOT NULL,
    quantity_ml INT NOT NULL,
    FOREIGN KEY (donor_id) REFERENCES Donors(donor_id),
    FOREIGN KEY (bloodbank_id) REFERENCES BloodBank(bloodbank_id)
);

-- Blood Requests

CREATE TABLE BloodRequests (
    request_id INT PRIMARY KEY AUTO_INCREMENT,
    recipient_id INT,
    bloodbank_id INT,
    request_date DATE NOT NULL,
    quantity_ml INT NOT NULL,
    status ENUM('Pending', 'Approved', 'Rejected', 'Completed') DEFAULT 'Pending',
    FOREIGN KEY (recipient_id) REFERENCES Recipients(recipient_id),
    FOREIGN KEY (bloodbank_id) REFERENCES BloodBank(bloodbank_id)
);


-- Blood Inventory

CREATE TABLE BloodInventory (
    blood_type ENUM('A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-') PRIMARY KEY,
    bloodbank_id INT,
    quantity_ml INT DEFAULT 0,
    FOREIGN KEY (bloodbank_id) REFERENCES BloodBank(bloodbank_id)
);

-- insertion in Donors table
INSERT INTO Donors (first_name, last_name, age, gender, blood_type, contact_number, address, last_donation_date)
VALUES
    ('Alice', 'Johnson', 28, 'Female', 'B+', '555-3344', '123 Oak St, Downtown', '2023-07-10'),
    ('Robert', 'Williams', 34, 'Male', 'O-', '555-4455', '456 Cedar St, Midtown', '2023-05-12'),
    ('Emily', 'Brown', 40, 'Female', 'A+', '555-5566', '789 Birch St, Uptown', '2022-12-22'),
    ('Michael', 'Davis', 27, 'Male', 'AB-', '555-6677', '101 Pine St, City Center', '2023-01-18'),
    ('Sarah', 'Miller', 31, 'Female', 'O+', '555-7788', '202 Maple St, Downtown', '2023-04-15');
    
select * from Donors;

-- insertion in Recipients
INSERT INTO Recipients (first_name, last_name, age, gender, blood_type, contact_number, address, hospital_name)
VALUES
    ('David', 'Clark', 45, 'Male', 'A+', '555-8899', '321 Elm St, City Center', 'General Hospital'),
    ('Jessica', 'Taylor', 30, 'Female', 'O-', '555-9900', '654 Willow St, Downtown', 'City Health Clinic'),
    ('Mark', 'Anderson', 52, 'Male', 'B+', '555-1122', '987 Maple St, Suburbs', 'Saint Mary\'s Hospital'),
    ('Laura', 'Thomas', 37, 'Female', 'AB-', '555-2233', '456 Oak St, Midtown', 'Regional Medical Center'),
    ('Sophia', 'Martinez', 26, 'Female', 'O+', '555-3344', '789 Pine St, Uptown', 'City Hospital');


-- BloodBank
INSERT INTO BloodBank (name, address, contact_number, email)
VALUES
    ('City Blood Bank', '123 Main St, City Center', '555-1234', 'contact@citybloodbank.org'),
    ('Regional Blood Bank', '456 Elm St, Uptown', '555-5678', 'info@regionalbloodbank.org'),
    ('Downtown Blood Bank', '789 Pine St, Downtown', '555-6789', 'support@downtownbloodbank.org'),
    ('Community Blood Bank', '101 Maple St, Suburbs', '555-7890', 'contact@communitybloodbank.org'),
    ('HealthCare Blood Bank', '202 Cedar St, Midtown', '555-8901', 'info@healthcarebloodbank.org');




-- Insertion in Donation
INSERT INTO Donations (donor_id, bloodbank_id, donation_date, quantity_ml)
VALUES
    (1, 1, '2023-07-10', 500),
    (2, 1, '2023-05-12', 450),
    (3, 2, '2022-12-22', 600),
    (4, 2, '2023-01-18', 550),
    (5, 1, '2023-04-15', 500);
    
-- BloodRequests
    INSERT INTO BloodRequests (recipient_id, bloodbank_id, request_date, quantity_ml, status)
VALUES
    (1, 1, '2023-09-15', 500, 'Pending'),
    (2, 1, '2023-08-10', 300, 'Approved'),
    (3, 2, '2023-07-20', 700, 'Completed'),
    (4, 2, '2023-10-05', 400, 'Rejected'),
    (5, 1, '2023-09-25', 600, 'Pending');
    
-- BloodInvertory

INSERT INTO BloodInventory (blood_type, bloodbank_id, quantity_ml)
VALUES
    ('A+', 1, 1500),
    ('O-', 1, 1200),
    ('B+', 2, 2000),
    ('AB-', 2, 800),
    ('O+', 1, 1800);


