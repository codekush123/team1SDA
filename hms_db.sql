CREATE DATABASE hms_db;
USE hms_db;

CREATE TABLE Patients (
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

CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    specialty VARCHAR(100),
    phone VARCHAR(20),
    email VARCHAR(100) UNIQUE
);

CREATE TABLE Nurses (
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
name varchar(50) not null,
gender int,
primary key (employee_id)
);

create table Receptionist (
receptionist_id int,
name varchar(50) not null,
shift varchar(50),
primary key (receptionist_id)
);


create table Department (
department_id int,
department_block int,
depart_name varchar(50) not null,
head_doctor int,
primary key (id)
);

create table Room (
	room_id int auto_increment primary key,
    type varchar(50) not null,
    availability boolean not null
);


create table Appointment (
	appointment_id int auto_increment primary key,
    patient_id int not null,
    doctor_id int not null,
    date_time datetime not null
    foreign key (patient_id) references Patient(patient_id),
    foreign key (doctor_id) references Doctor(doctor_id)
);


create table MedicalRecord (
	record_id int auto_increment primary key,
    patient_id int not null,
    doctor_id int not null,
    diagnosis text,
    treatment text,
    record_date date not null
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
    FOREIGN KEY (doctor_id) REFERENCES Doctor(id)
);


CREATE TABLE Bill (
    invoice_id     INT PRIMARY KEY,
    amount         DECIMAL(10,2),
    bill_date           DATE,
    patient_id     INT,
    insurance_id   INT NULL,
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
    FOREIGN KEY (insurance_id) REFERENCES Insurance(insurance_id)
);


CREATE TABLE Medication (
    medication_id  INT PRIMARY KEY,
    name           VARCHAR(100),
    type           VARCHAR(50),
    price          DECIMAL(10,2)
);


CREATE TABLE Insurance (
    insurance_id   INT PRIMARY KEY,
    policy_number  VARCHAR(50) UNIQUE,
    provider_name  VARCHAR(100),
    patient_id     INT,
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id)
);




