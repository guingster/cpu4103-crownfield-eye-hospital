-- ============================================================================
-- Crownfield Eye Hospital Database - Stored Procedure and Trigger (C06 to C07)
-- Module: CPU4103 Introduction to Databases
-- ============================================================================

USE crownfield_eye_hospital_guilherme;

-- C06: Create a Stored Procedure to retrieve a patient's history
DELIMITER //
CREATE PROCEDURE GetPatientHistory(IN p_id VARCHAR(10))
BEGIN
    SELECT 
        a.appointment_date AS 'Date', 
        a.appointment_status AS 'Status', 
        d.diagnosis_name AS 'Diagnosis'
    FROM 
        appointments a
    LEFT JOIN 
        diagnoses d ON a.appointment_id = d.appointment_id
    WHERE 
        a.patient_id = p_id
    ORDER BY 
        a.appointment_date DESC;
END //
DELIMITER ;

-- Note: To execute the procedure, run -> CALL GetPatientHistory('P001');

-- C07: Create a Trigger to prevent booking appointments in the past
DELIMITER //
CREATE TRIGGER trg_prevent_past_appointments
BEFORE INSERT ON appointments
FOR EACH ROW
BEGIN
    IF NEW.appointment_date < CURDATE() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Cannot book an appointment in the past.';
    END IF;
END //
DELIMITER ;

-- Note: Trigger tested by attempting to insert a date like '2020-01-01'