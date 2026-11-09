# Crownfield Eye Hospital Database Prototype

## Setup Steps
1. Open MySQL Workbench.
2. Connect to a local or remote MySQL server instance.
3. Open and execute the SQL scripts in the exact numerical order listed below.

## File Execution Order
1. `01_schema.sql` - Creates the database `crownfield_eye_hospital_guilherme` and constructs the DDL table schema.
2. `01b_insert_data.sql` - Populates the tables with synthetic DML data, respecting foreign key hierarchies.
3. `02_individual_queries.sql` - Executes the required SELECT, JOIN, and GROUP BY queries.
4. `03_procedure_and_trigger.sql` - Creates the stored procedure for patient history and the trigger preventing past appointments.
5. `04_security.sql` - Sets up database roles (Administrator/Receptionist) and demonstrates transaction control (ROLLBACK).

## Assumptions
* Each clinic facility operates independently.
* A patient can receive multiple diagnoses and multiple prescriptions in a single medical appointment.
* Security roles assume the hospital employs a robust Administrator and Receptionist access environment.