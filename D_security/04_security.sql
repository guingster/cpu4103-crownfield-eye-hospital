-- ============================================================================
-- Crownfield Eye Hospital Database - Security and Transactions (D01 to D02)
-- Module: CPU4103 Introduction to Databases
-- ============================================================================

USE crownfield_eye_hospital_guilherme;

-- D01: Create roles for the hospital database
CREATE ROLE 'Administrator', 'Receptionist';

-- Assign full privileges to the Administrator
GRANT ALL PRIVILEGES ON crownfield_eye_hospital_guilherme.* TO 'Administrator';

-- Assign limited privileges to the Receptionist (No DELETE allowed)
GRANT SELECT, INSERT, UPDATE ON crownfield_eye_hospital_guilherme.appointments TO 'Receptionist';
GRANT SELECT ON crownfield_eye_hospital_guilherme.patients TO 'Receptionist';

-- D02: Demonstrate Transaction Control with ROLLBACK
START TRANSACTION;

-- Attempt to insert a new patient
INSERT INTO patients (patient_id, first_name, last_name, postcode) 
VALUES ('P099', 'Test', 'User', 'L1 0AA');

-- Simulate an error or cancellation during the process
ROLLBACK;