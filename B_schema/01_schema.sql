-- ============================================================================
-- Crownfield Eye Hospital Database - Schema Definition (DDL)
-- Module: CPU4103 Introduction to Databases
-- ============================================================================

-- 1. Database Creation and Selection
CREATE DATABASE IF NOT EXISTS crownfield_eye_hospital_guilherme;
USE crownfield_eye_hospital_guilherme;

-- 2. Independent Tables: Patients, Clinicians, and Clinics
CREATE TABLE patients (
    patient_id VARCHAR(10) PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name  VARCHAR(50) NOT NULL,
    postcode   VARCHAR(10) NOT NULL
);

CREATE TABLE clinicians (
    clinician_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name   VARCHAR(50) NOT NULL,
    last_name    VARCHAR(50) NOT NULL,
    specialty    VARCHAR(100) NULL
);

CREATE TABLE clinics (
    clinic_id   INT AUTO_INCREMENT PRIMARY KEY,
    clinic_name VARCHAR(100) NOT NULL,
    location    VARCHAR(100) NULL
);

-- 3. Core Transactional Table: Appointments
CREATE TABLE appointments (
    appointment_id     INT AUTO_INCREMENT PRIMARY KEY,
    patient_id         VARCHAR(10) NOT NULL,
    clinician_id       INT NOT NULL,
    clinic_id          INT NOT NULL,
    appointment_date   DATE NOT NULL,
    appointment_time   TIME NOT NULL,
    appointment_status VARCHAR(20) NOT NULL DEFAULT 'Booked',
    notes              VARCHAR(255) NULL,
    FOREIGN KEY (patient_id)   REFERENCES patients(patient_id),
    FOREIGN KEY (clinician_id) REFERENCES clinicians(clinician_id),
    FOREIGN KEY (clinic_id)    REFERENCES clinics(clinic_id)
);

-- 4. Clinical Records and Catalogue: Diagnoses and Medicines
CREATE TABLE diagnoses (
    diagnosis_id   INT AUTO_INCREMENT PRIMARY KEY,
    appointment_id INT NOT NULL,
    diagnosis_name VARCHAR(150) NOT NULL,
    diagnosis_date DATE NOT NULL,
    notes          VARCHAR(255) NULL,
    FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id)
);

CREATE TABLE medicines (
    medicine_id   INT AUTO_INCREMENT PRIMARY KEY,
    medicine_name VARCHAR(100) NOT NULL,
    medicine_type VARCHAR(50) NULL,
    description   VARCHAR(255) NULL
);

-- 5. Dependent Table: Prescriptions
CREATE TABLE prescriptions (
    prescription_id INT AUTO_INCREMENT PRIMARY KEY,
    appointment_id  INT NOT NULL,
    medicine_id     INT NOT NULL,
    dosage          VARCHAR(100) NOT NULL,
    duration        VARCHAR(50) NOT NULL,
    instructions    VARCHAR(255) NULL,
    FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id),
    FOREIGN KEY (medicine_id)    REFERENCES medicines(medicine_id)
);