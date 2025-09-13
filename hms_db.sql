CREATE DATABASE hms_db;
USE hms_db;

CREATE TABLE Patient (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    date_of_birth DATE,
    gender VARCHAR(10),
    address VARCHAR(255),
    medical_history TEXT,
    phone VARCHAR(20),
    email VARCHAR(100) UNIQUE
);

CREATE TABLE Doctor (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    specialty VARCHAR(100),
    phone VARCHAR(20),
    email VARCHAR(100) UNIQUE
);

CREATE TABLE Nurse (
    nurse_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    qualification VARCHAR(150),
    department VARCHAR(100),
    phone VARCHAR(20),
    email VARCHAR(100) UNIQUE
);

create table Employee (
    employee_id int not null,
    employe_name varchar(50) not null,
    gender int,
    primary key (employee_id)
);

create table Receptionist (
    receptionist_id int,
    receptionist_name varchar(50) not null,
    shift varchar(50),
    primary key (receptionist_id)
);


create table Department (
    department_id int,
    department_block int,
    depart_name varchar(50) not null,
    head_doctor int,
    primary key (department_id)
);

CREATE TABLE Room (
    room_id INT AUTO_INCREMENT PRIMARY KEY,
    room_type VARCHAR(50) NOT NULL,
    availability BOOLEAN NOT NULL,
    patient_id INT,
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id)
);



create table Appointment (
	appointment_id int auto_increment primary key,
    patient_id int not null,
    doctor_id int not null,
    date_time datetime not null,
    foreign key (patient_id) references Patient(patient_id),
    foreign key (doctor_id) references Doctor(doctor_id)
);


create table MedicalRecord (
	record_id int auto_increment primary key,
    patient_id int not null,
    doctor_id int not null,
    diagnosis text,
    treatment text,
    record_date date not null,
    foreign key (patient_id) references Patient(patient_id),
    foreign key (doctor_id) references Doctor(doctor_id)
);


CREATE TABLE TestReport (
    report_id      INT PRIMARY KEY,
    test_result    VARCHAR(255),
    test_type      VARCHAR(100),
    patient_id     INT,
    doctor_id      INT,
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id)
);


CREATE TABLE Bill (
    invoice_id INT PRIMARY KEY,
    amount DECIMAL(10,2),
    bill_date DATE,
    patient_id INT,
    insurance_id INT NULL,
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
    FOREIGN KEY (insurance_id) REFERENCES Insurance(insurance_id)
);


CREATE TABLE Medication (
    medication_id INT PRIMARY KEY,
    medicine_name VARCHAR(100),
    medicine_type VARCHAR(50),
    price DECIMAL(10,2)
);


CREATE TABLE Insurance (
    insurance_id   INT PRIMARY KEY,
    policy_number  VARCHAR(50) UNIQUE,
    provider_name  VARCHAR(100),
    patient_id     INT,
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id)
);

DESCRIBE Patient;
DESCRIBE Doctor;
DESCRIBE Nurse;
DESCRIBE Employee;
DESCRIBE Receptionist;
DESCRIBE Department;
DESCRIBE Room;
DESCRIBE Appointment;
DESCRIBE MedicalRecord;
DESCRIBE TestReport;
DESCRIBE Bill;
DESCRIBE Medication;
DESCRIBE Insurance;

INSERT INTO Patient (first_name, last_name, date_of_birth, gender, address, medical_history, phone, email)
VALUES
('John', 'Doe', '1985-07-12', 'Male', '123 Main St', 'Diabetes', '555-1234', 'john.doe@email.com'),
('Jane', 'Smith', '1990-02-15', 'Female', '456 Oak St', 'Asthma', '555-5678', 'jane.smith@email.com'),
('Michael', 'Johnson', '1975-09-30', 'Male', '789 Pine Rd', 'Hypertension', '555-9012', 'michael.johnson@email.com');

INSERT INTO Doctor (first_name, last_name, specialty, phone, email)
VALUES
('Alice', 'Brown', 'Cardiology', '555-1111', 'alice.brown@hospital.com'),
('Robert', 'Taylor', 'Neurology', '555-2222', 'robert.taylor@hospital.com'),
('Emily', 'Clark', 'Pediatrics', '555-3333', 'emily.clark@hospital.com');


INSERT INTO Nurse (first_name, last_name, qualification, department, phone, email)
VALUES
('Sarah', 'Miller', 'BSN', 'Emergency', '555-4444', 'sarah.miller@hospital.com'),
('David', 'Wilson', 'RN', 'ICU', '555-5555', 'david.wilson@hospital.com'),
('Laura', 'Davis', 'MSN', 'Pediatrics', '555-6666', 'laura.davis@hospital.com');


INSERT INTO Employee (employee_id, employe_name, gender)
VALUES
(1, 'George White', 1),
(2, 'Linda Green', 2),
(3, 'Paul Black', 1);


INSERT INTO Receptionist (receptionist_id, receptionist_name, shift)
VALUES
(1, 'Karen Hill', 'Morning'),
(2, 'Tom Adams', 'Evening');


INSERT INTO Department (department_id, department_block, depart_name, head_doctor)
VALUES
(1, 101, 'Cardiology', 1),
(2, 102, 'Neurology', 2),
(3, 103, 'Pediatrics', 3);


INSERT INTO Room (room_type, availability, patient_id)
VALUES
('General', TRUE, 1),
('ICU', FALSE, 2),
('Private', TRUE, 3);


INSERT INTO Appointment (patient_id, doctor_id, date_time)
VALUES
(1, 1, '2025-09-15 10:00:00'),
(2, 2, '2025-09-16 14:30:00'),
(3, 3, '2025-09-17 09:15:00');


INSERT INTO MedicalRecord (patient_id, doctor_id, diagnosis, treatment, record_date)
VALUES
(1, 1, 'Heart Disease', 'Medication + Lifestyle Changes', '2025-09-10'),
(2, 2, 'Migraine', 'Painkillers + Rest', '2025-09-11'),
(3, 3, 'Flu', 'Antiviral + Rest', '2025-09-12');


INSERT INTO TestReport (report_id, test_result, test_type, patient_id, doctor_id)
VALUES
(1, 'High Cholesterol', 'Blood Test', 1, 1),
(2, 'Normal MRI', 'MRI Scan', 2, 2),
(3, 'Positive for Influenza', 'Swab Test', 3, 3);


INSERT INTO Medication (medication_id, medicine_name, medicine_type, price)
VALUES
(1, 'Aspirin', 'Tablet', 5.00),
(2, 'Amoxicillin', 'Capsule', 12.50),
(3, 'Paracetamol', 'Syrup', 7.25);


INSERT INTO Insurance (insurance_id, policy_number, provider_name, patient_id)
VALUES
(1, 'POL12345', 'BlueCross', 1),
(2, 'POL67890', 'Aetna', 2),
(3, 'POL54321', 'UnitedHealth', 3);


INSERT INTO Bill (invoice_id, amount, bill_date, patient_id, insurance_id)
VALUES
(1, 250.00, '2025-09-10', 1, 1),
(2, 400.00, '2025-09-11', 2, 2),
(3, 150.00, '2025-09-12', 3, 3);



SHOW TABLES;
SELECT * FROM Patient;
SELECT * FROM Doctor;
SELECT * FROM Appointment;
SELECT * FROM Bill;
SELECT * FROM Nurse;
SELECT * FROM Room;
SELECT * FROM Department;
SELECT * FROM Employee;
SELECT * FROM Insurance;
SELECT * FROM Medication;
SELECT * FROM TestReport;
SELECT * FROM MedicalRecord;
SELECT * FROM Receptionist;






