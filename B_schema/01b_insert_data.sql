-- ============================================================================
-- Crownfield Eye Hospital Database - Data Population (DML)
-- Module: CPU4103 Introduction to Databases
-- ============================================================================

USE crownfield_eye_hospital_guilherme;

-- 1. Populate Independent Tables (Patients, Clinicians, Clinics)
INSERT INTO patients (patient_id, first_name, last_name, postcode) VALUES
('P001', 'John', 'Smith', 'L1 4DQ'),
('P002', 'Emma', 'Watson', 'L3 2BX');

INSERT INTO clinicians (first_name, last_name, specialty) VALUES
('Sarah', 'Jenkins', 'Ophthalmology'),
('David', 'Miller', 'Optometry');

INSERT INTO clinics (clinic_name, location) VALUES
('Glaucoma Clinic', 'Building A - Room 102'),
('Cornea Clinic', 'Building B - Room 205');

-- 2. Populate Core Transactional Table (Appointments)
INSERT INTO appointments (patient_id, clinician_id, clinic_id, appointment_date, appointment_time, appointment_status, notes) VALUES
('P001', 1, 1, '2026-11-10', '09:00:00', 'Booked', 'Routine pressure check'),
('P002', 2, 2, '2026-11-10', '10:30:00', 'Booked', 'Post-op follow-up');

-- 3. Populate Clinical Records and Catalogue (Diagnoses, Medicines)
INSERT INTO diagnoses (appointment_id, diagnosis_name, diagnosis_date, notes) VALUES
(1, 'Ocular Hypertension', '2026-11-10', 'Monitor intraocular pressure closely.'),
(2, 'Dry Eye Syndrome', '2026-11-10', 'Prescribed artificial tears and lifestyle adjustments.');

INSERT INTO medicines (medicine_name, medicine_type, description) VALUES
('Latanoprost', 'Eye Drops', 'Prostaglandin analog used to treat elevated intraocular pressure.'),
('Hypromellose', 'Lubricant Eye Drops', 'Artificial tears for dry eye relief.');

-- 4. Populate Dependent Table (Prescriptions)
INSERT INTO prescriptions (appointment_id, medicine_id, dosage, duration, instructions) VALUES
(1, 1, '1 drop', '30 days', 'Apply 1 drop in the affected eye once daily at night.'),
(2, 2, '1-2 drops', '14 days', 'Apply as needed for dryness up to 4 times a day.');