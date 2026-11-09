-- ============================================================================
-- Crownfield Eye Hospital Database - Individual Queries (C01 to C05)
-- Module: CPU4103 Introduction to Databases
-- ============================================================================

USE crownfield_eye_hospital_guilherme;

-- C01: List patient identification and location details
SELECT 
    patient_id AS 'Patient ID',
    CONCAT(first_name, ' ', last_name) AS 'Patient Name',
    postcode AS 'Postcode'
FROM 
    patients
ORDER BY 
    last_name ASC;

-- C02: List appointments with patient and clinician details (INNER JOIN)
SELECT 
    a.appointment_id AS 'Appt ID',
    CONCAT(p.first_name, ' ', p.last_name) AS 'Patient Name',
    CONCAT(c.first_name, ' ', c.last_name) AS 'Clinician Name',
    a.appointment_date AS 'Date',
    a.appointment_time AS 'Time',
    a.appointment_status AS 'Status'
FROM 
    appointments a
INNER JOIN 
    patients p ON a.patient_id = p.patient_id
INNER JOIN 
    clinicians c ON a.clinician_id = c.clinician_id
ORDER BY 
    a.appointment_date ASC;

-- C03: Comprehensive patient report with diagnoses and prescriptions (LEFT JOIN)
SELECT 
    p.patient_id AS 'Patient ID',
    CONCAT(p.first_name, ' ', p.last_name) AS 'Patient Name',
    a.appointment_date AS 'Date',
    d.diagnosis_name AS 'Diagnosis',
    m.medicine_name AS 'Prescribed Medicine',
    pr.dosage AS 'Dosage'
FROM 
    patients p
INNER JOIN 
    appointments a ON p.patient_id = a.patient_id
INNER JOIN 
    diagnoses d ON a.appointment_id = d.appointment_id
LEFT JOIN 
    prescriptions pr ON a.appointment_id = pr.appointment_id
LEFT JOIN 
    medicines m ON pr.medicine_id = m.medicine_id;

-- C04: Count total appointments per clinic (Aggregate / GROUP BY)
SELECT 
    cl.clinic_name AS 'Clinic Name',
    cl.location AS 'Location',
    COUNT(a.appointment_id) AS 'Total Appointments'
FROM 
    clinics cl
LEFT JOIN 
    appointments a ON cl.clinic_id = a.clinic_id
GROUP BY 
    cl.clinic_id, 
    cl.clinic_name, 
    cl.location
ORDER BY 
    COUNT(a.appointment_id) DESC;

-- C05: Find the patient with the latest appointment using a subquery
SELECT 
    patient_id AS 'Patient ID', 
    CONCAT(first_name, ' ', last_name) AS 'Patient Name'
FROM 
    patients
WHERE 
    patient_id = (
        SELECT patient_id 
        FROM appointments 
        ORDER BY appointment_date DESC, appointment_time DESC 
        LIMIT 1
    );