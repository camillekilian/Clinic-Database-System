# Dentist Database Management System


# Creating Tables

CREATE TABLE insurance(
	InsuranceID 	VARCHAR(255) 	NOT NULL,
	PlanName 		VARCHAR(20) 	NOT NULL,
    CoverageStatus	VARCHAR(10)		NOT NULL,
    PRIMARY KEY (InsuranceID)
);


CREATE TABLE patient(
	PatientID			VARCHAR(255)	NOT NULL,
    FirstName 			VARCHAR(255)	NOT NULL,
    LastName			VARCHAR(255)	NOT NULL,
    DOB					DATE			NOT NULL,
    Email				VARCHAR(255)	NOT NULL,
    Phone				VARCHAR(255)	NOT NULL,
    Gender				VARCHAR(255)	NOT NULL,
    Address				VARCHAR(255)	NOT NULL,
    MemberID			VARCHAR(255)	NOT NULL,
    GroupID				VARCHAR(255)	NOT NULL,
    PRIMARY KEY (PatientID)
);

CREATE TABLE staff(
	StaffID				VARCHAR(255)	NOT NULL,
    FirstName			VARCHAR(255) 	NOT NULL,
    LastName			VARCHAR(255)	NOT NULL,
    Title 				VARCHAR(255) 	NOT NULL,
    PRIMARY KEY (StaffID)
);

CREATE TABLE appointment(
	AppointmentID		VARCHAR(255)	NOT NULL,
    PatientID 			VARCHAR(255) 	NOT NULL,
    StaffID 			VARCHAR(255) 	NOT NULL,
    Appointment_Date	DATE 			NOT NULL,
    Appointment_Time	TIME	 		NOT NULL,
    Reason				VARCHAR(255)	NOT NULL,
    PRIMARY KEY (AppointmentID),
    CONSTRAINT uc1 UNIQUE (StaffID, Appointment_Time, Appointment_Date),
    CONSTRAINT fk2 FOREIGN KEY (PatientID) REFERENCES patient(PatientID) ON DELETE CASCADE,
    CONSTRAINT fk3 FOREIGN KEY (StaffID) REFERENCES staff(StaffID) ON DELETE CASCADE
);

CREATE TABLE visit(
	VisitID				VARCHAR(255)	NOT NULL,
    AppointmentID 		VARCHAR(255) 	NOT NULL,
    PatientID			VARCHAR(255)	NOT NULL,
    StaffID				VARCHAR(255)	NOT NULL,
    InsuranceID			VARCHAR(255)	NOT NULL,
    Medication			VARCHAR(255)	NOT NULL 	DEFAULT "None",
    Risk				VARCHAR(255)	NOT NULL,
    FollowUp			VARCHAR(255),
    BillableAmount		INT 			NOT NULL,
    PaymentStatus		VARCHAR(255)	NOT NULL 	DEFAULT "Unpaid",
    PRIMARY KEY (VisitID),
    CONSTRAINT fk4 FOREIGN KEY (PatientID) REFERENCES patient(PatientID) ON DELETE CASCADE,
    CONSTRAINT fk5 FOREIGN KEY (StaffID) REFERENCES staff(StaffID) ON DELETE CASCADE,
    CONSTRAINT fk6 FOREIGN KEY (InsuranceID) REFERENCES insurance(InsuranceID) ON DELETE CASCADE
    
    
);

# Inserting Data into Tables

INSERT INTO insurance (InsuranceID, PlanName, CoverageStatus) VALUES('123', 'United Health', 'Yes');
INSERT INTO insurance (InsuranceID, PlanName, CoverageStatus) VALUES('456','United Health', 'No');
INSERT INTO insurance (InsuranceID, PlanName, CoverageStatus) VALUES('101', 'Aetna', 'Yes');
INSERT INTO insurance (InsuranceID, PlanName, CoverageStatus) VALUES('789', 'Aetna', 'No');
INSERT INTO insurance (InsuranceID, PlanName, CoverageStatus) VALUES('292', 'Cigna', 'Yes');
INSERT INTO insurance (InsuranceID, PlanName, CoverageStatus) VALUES('467','Cigna', 'No');
INSERT INTO insurance (InsuranceID, PlanName, CoverageStatus) VALUES('302', 'CVS Health', 'Yes');
INSERT INTO insurance (InsuranceID, PlanName, CoverageStatus) VALUES('603', 'CVS Health', 'No');
INSERT INTO insurance (InsuranceID, PlanName, CoverageStatus) VALUES('403', 'Blue Cross', 'Yes');
INSERT INTO insurance (InsuranceID, PlanName, CoverageStatus) VALUES('195','Blue Cross', 'No');
INSERT INTO insurance (InsuranceID, PlanName, CoverageStatus) VALUES('593', 'Anthem', 'Yes');
INSERT INTO insurance (InsuranceID, PlanName, CoverageStatus) VALUES('692', 'Anthem', 'No');
INSERT INTO insurance (InsuranceID, PlanName, CoverageStatus) VALUES('444','Florida Blue', 'No');
INSERT INTO insurance (InsuranceID, PlanName, CoverageStatus) VALUES('240','Florida Blue', 'Yes');


INSERT INTO patient (PatientID, FirstName, LastName, DOB, Email, Phone, Gender, Address, MemberID, GroupID) VALUES ('1', 'Basilio', 'Firmin', '1965-12-20', 'basilio.firman@gmail.com', '123-456-7891', 'M', '706 Beechwood Ave. Miami, FL 33126', '123456', '78934'),
																																('2', 'Giusy', 'Lazzari', '1977-04-12', 'giusy.lazzari@gmail.com', '305-200-5468', 'F', '439 Lookout St. Fort Lauderdale, FL 33317', '536279', '11111'),
																																('3', 'Giampaolo', 'Danielson', '1990-11-05', 'gianpaolo.danielson@gmail.com', '305-201-0276', 'M', '852 Rock Creek Court Hollywood, FL 33024', '222333', '78787'),
																																('4', 'Tyrone', 'Lum', '1969-09-08', 'tyrone.lum@gmail.com', '305-205-6793', 'M', '5 Union Dr. Miami, FL 33142', '435677', '44456'),
																																('5', 'Amyas', 'Mondo', '1986-07-10', 'amyas.mondo@gmail.com', '305-214-9115', 'F', '81 Lafayette Dr. Miami, FL 33174', '62627', '55678'),
																																('6', 'Caridad', 'Mathers', '1960-01-10', 'caridad.mathers@gmail.com', '561-261-0692', 'F', '779 NE. Illinois Drive Miami, FL 33147', '912345', '58912'),
																																('7', 'Payne', 'Yatzil', '1993-02-14', 'payne.yatzil@gmail.com', '561-270-2822', 'M', '8404 Corona St. Miami, FL 33134', '478123', '98765'),
                                                                                                                                ('8', 'Marly', 'Rocchi', '1970-03-08', 'marly_rocchi@hotmail.com', '561-273-5904', 'F', '32 Brookside Street Miami, FL 33162', '33091', '90202'),
                                                                                                                                ('9', 'Lidia', 'Palmisano', '1958-08-10', 'lidia.palmisano@gmail.com', '561-271-4145', 'F', '7432 East Smith Store Street Hialeah, FL 33010', '65432', '60503'),
                                                                                                                                ('10','Lita', 'Hathaway', '1985-10-01', 'lita.hathaway@yahoo.com', '561-272-0813', 'F', '17 White Dr. Miami, FL 33186', '23030', '90201'),
                                                                                                                                ('11','Baldric', 'Adair', '1960-03-04', 'baldric.adair@gmail.com', '305-210-4660', 'M', '638 Ohio Lane Hallandale, FL 33009', '39321', '21102'),
                                                                                                                                ('12', 'Lucas', 'Alonso', '1995-05-06', 'lucas_alonso95@hotmail.com', '786-633-4432', 'M', '1800 N Bayshore Dr Miami, FL 33133', '22044', '87653'),
                                                                                                                                ('13', 'Maria', 'Gomez', '1990-09-27', 'merygomez@gmail.com', '305-202-4302', 'F', '801 Brickell Ave Miami, FL 33229', '30390', '11394'),
                                                                                                                                ('14', 'Bruno', 'Perez', '1998-11-03', 'bruno.perez@gmail.com', '305-103-3654', 'M', '12234 SW 289th Ter Homestead, FL, 33431', '70542', '60543'),
                                                                                                                                ('15', 'Rafael', 'Miranda', '1991-03-10', 'rafamiranda@hotmail.com', '786-293-2922', 'M', '54 Brookside Street Miami, FL 33162','65543', '11142' )																																				
																																;

INSERT INTO staff (StaffID, FirstName, LastName, Title) VALUES ('1', 'Simon', 'Goodwin', 'Dentist');		
INSERT INTO staff (StaffID, FirstName, LastName, Title) VALUES ('2', 'Linda', 'Gardner', 'Hygienist');
INSERT INTO staff (StaffID, FirstName, LastName, Title) VALUES ('3', 'Chloe', 'Edwards', 'Hygienist');


INSERT INTO appointment (AppointmentID, PatientID, StaffID, Appointment_Date, Appointment_Time, Reason) VALUES ('001', '1', '1', '2022-02-10', '13:00:00', 'Cavity Detection'), 
																											   ('002', '1', '2', '2022-04-03', '10:00:00', 'Teeth Whitening'),
                                                                                                               ('003', '2', '1', '2022-04-03', '12:00:00', 'Teeth Whitening'),
                                                                                                               ('004', '2', '3', '2022-06-28', '10:00:00', 'Cleaning'),
                                                                                                               ('005', '2', '1', '2022-08-11', '08:00:00', 'Wisdom Removal'),
                                                                                                               ('006', '3', '1', '2022-05-06', '14:00:00', 'Cavity Detection'),
                                                                                                               ('007', '3', '1', '2022-05-07', '14:00:00', 'Cavity Detection'),
                                                                                                               ('008', '3', '2', '2022-11-06', '10:00:00', 'Cleaning'),
                                                                                                               ('009', '4', '1', '2022-11-06', '14:00:00', 'Cavity Detection'),
                                                                                                               ('010', '4', '1', '2022-12-08', '08:00:00', 'Widsom Removal'),
                                                                                                               ('011', '4', '2', '2022-08-10', '15:00:00', 'Gum Infection'),
                                                                                                               ('012', '5', '1', '2022-07-12', '14:00:00', 'Annual Check'),
                                                                                                               ('013', '6', '2', '2022-02-01', '16:00:00', 'Cleaning'),
                                                                                                               ('014', '6', '1', '2022-04-06', '10:00:00', 'Cavity Detection'),
                                                                                                               ('015', '7', '3', '2021-12-08', '09:00:00', 'Cleaning'),
                                                                                                               ('016', '7', '1', '2022-01-10', '09:00:00', 'Gum Infection'),
                                                                                                               ('017', '8', '3', '2021-11-01', '09:00:00', 'Cleaning'),
                                                                                                               ('018', '8', '3', '2021-09-08', '10:00:00', 'Annual Check'),
                                                                                                               ('019', '9', '1', '2021-12-02', '09:00:00', 'Wisdom Removal'),
                                                                                                               ('020', '10', '1', '2022-09-18', '09:00:00', 'Cavity Detection'),
                                                                                                               ('021', '10', '1', '2022-11-18', '15:00:00', 'Gum Infection'),
                                                                                                               ('022', '11', '1', '2021-09-20', '17:00:00', 'Annual Check'),
                                                                                                               ('023', '11', '2', '2022-05-25', '10:00:00', 'Cavity Detection'),
                                                                                                               ('024', '12', '3', '2021-09-21', '17:00:00', 'Teeth Whitening'),
                                                                                                               ('025', '12', '1', '2022-09-21', '10:00:00', 'Annual Check'),
                                                                                                               ('026', '13', '2', '2021-05-20', '11:00:00', 'Teeth Whitening'),
                                                                                                               ('027', '14', '1', '2022-04-02', '10:00:00', 'Annual Check'),
                                                                                                               ('028', '15', '3', '2022-07-10', '12:00:00', 'Cleaning')
                                                                                                               ;


INSERT INTO  visit (VisitID, AppointmentID, PatientID, StaffID, InsuranceID, Medication, Risk, FollowUp, BillableAmount, PaymentStatus) VALUES ('V1','001', '1', '1', '101', 'Tylenol', 'Medium', 'Yes', '300', 'Unpaid'),
																											   ('V2','002', '1', '2', '789', 'None', 'Low', 'No', '200', 'Paid'),
                                                                                                               ('V3', '003', '2', '1', '123','None', 'Low', 'No', '200', 'Unpaid'),
                                                                                                               ('V4', '004', '2', '3', '456', 'None', 'Low', 'No', '150', 'Unpaid'),
                                                                                                               ('V5', '005', '2', '1', '123', 'Advil', 'High', 'Yes', '750', 'Paid'),
                                                                                                               ('V6', '006', '3', '1', '123', 'Tylenol', 'Medium', 'Yes', '300', 'Unpaid'),
                                                                                                               ('V7', '007', '3', '1', '123', 'Tylenol', 'Medium', 'Yes', '300', 'Paid'),
                                                                                                               ('V8', '008', '3', '2', '456', 'None', 'Low', 'No', '150', 'Paid'),
                                                                                                               ('V9', '009', '4', '1', '292', 'Tylenol', 'Medium', 'Yes', '300', 'Unpaid'),
                                                                                                               ('V10','010', '4', '1', '467', 'Advil', 'High', 'Yes', '750', 'Paid'),
                                                                                                               ('V11','011', '4', '2', '467', 'Aleve', 'Medium', 'Yes', '500', 'Paid'),
                                                                                                               ('V12','012', '5', '1', '302','None', 'Low', 'No', '150', 'Paid'),
                                                                                                               ('V13','013', '6', '2', '603','None', 'Low', 'No', '150', 'Unpaid'),
                                                                                                               ('V14','014', '6', '1', '302', 'None', 'Low', 'Yes', '300', 'Paid'),
                                                                                                               ('V15','015', '7', '3', '403', 'Advil', 'High', 'Yes', '150', 'Paid'),
                                                                                                               ('V16','016', '7', '1', '195', 'Aleve', 'High', 'Yes', '500', 'Unpaid'),
                                                                                                               ('V17','017', '8', '3', '240', 'None', 'Medium', 'Yes', '150', 'Unpaid'),
                                                                                                               ('V18','018', '8', '3', '444', 'None', 'Low', 'No', '150', 'Unpaid'),
                                                                                                               ('V19','019', '9', '1', '593', 'Advil', 'Medium', 'Yes', '750', 'Unpaid'),
																											   ('V20','020', '10', '1', '593','Tylenol', 'Medium', 'Yes', '300', 'Unpaid'),
                                                                                                               ('V21','021', '10', '1', '692', 'Aleve', 'Medium', 'Yes', '500', 'Paid'),
                                                                                                               ('V22','022', '11', '1', '292', 'None', 'Low', 'No', '150', 'Paid'),
                                                                                                               ('V23','023', '11', '2', '467', 'Tylenol', 'Low', 'Yes', '300', 'Paid'),
                                                                                                               ('V24','024', '12', '3', '123','None', 'Low', 'No', '200', 'Paid'),
                                                                                                               ('V25','025', '12', '1', '456', 'None', 'Low', 'No', '150', 'Unpaid'),
                                                                                                               ('V26','026', '13', '2', '101','None', 'Low', 'Yes', '200', 'Unpaid'),
                                                                                                               ('V27','027', '14', '1', '403','None', 'Low', 'No', '150', 'Unpaid'),
                                                                                                               ('V28','028', '15', '3', '444','None', 'Low', 'No', '150', 'Paid')
                                                                                                               ;

				
# Creating Views

#Patient_bill view to check either insurance or patient should pay for the visit
CREATE OR REPLACE VIEW patient_bill AS SELECT 
p.patientID, p.FirstName, p.LastName, p.email, p.Phone, i.PlanName, p.memberID, p.groupid, CONCAT('$',FORMAT(v.billableAmount, 0)) AS 'Billable Amount', i.coveragestatus, v.paymentstatus
FROM patient p
JOIN visit v 
	USING (PatientID)
JOIN insurance i
	USING (InsuranceID)
WHERE v.paymentstatus = 'Unpaid';

#Patient_Visit view to check the patient visit and appointment to see patients that need follow up
CREATE OR REPLACE VIEW patient_visit AS SELECT
p.patientID, p.firstname, p.lastname, a.appointment_Date, a.reason, v.risk, v.medication, v.followup
FROM patient p
JOIN appointment a
 USING (PatientID)
JOIN visit v
	USING (appointmentID)
WHERE v.followup = 'Yes';

#Simon scehdule - appointment are ordered by date and time
CREATE OR REPLACE VIEW Simon_schedule AS SELECT
s.staffID, s.FirstName, s.LastName, a.Appointment_Date, a.Appointment_Time, a.reason
FROM staff s
JOIN appointment a 
	USING (staffID)
WHERE s.staffID = 1
ORDER BY a.Appointment_Date desc, a.Appointment_Time asc;

#Linda scehdule - appointment are ordered by date and time
CREATE OR REPLACE VIEW Linda_schedule AS SELECT
s.staffID, s.FirstName, s.LastName, a.Appointment_Date, a.Appointment_Time, a.reason
FROM staff s
JOIN appointment a 
	USING (staffID)
WHERE s.staffID = 2
ORDER BY a.Appointment_Date desc, a.Appointment_Time asc;

#Chloe scehdule - appointment are ordered by date and time
CREATE OR REPLACE VIEW Chloe_schedule AS SELECT
s.staffID, s.FirstName, s.LastName, a.Appointment_Date, a.Appointment_Time, a.reason
FROM staff s
JOIN appointment a 
	USING (staffID)
WHERE s.staffID = 3
ORDER BY a.Appointment_Date desc, a.Appointment_Time asc;

# Creating Stored Procedures
 
DELIMITER $$

 # insert_new_patient
 # provide id, first name, last name, email, DOB, phone, gender, address, groupID, MemberID to add to the patients table
 
CREATE PROCEDURE insert_new_patient(IN p_id VARCHAR(255), IN p_first VARCHAR(255), IN p_last VARCHAR(255), IN p_dob DATE, IN p_email VARCHAR(255), IN p_phone VARCHAR(255), IN p_gender VARCHAR(255), IN p_address VARCHAR(255), IN p_MemberID VARCHAR(255), IN p_GroupID VARCHAR(255))
BEGIN
	INSERT INTO patient(PatientID, FirstName, LastName, DOB, Email, Phone, Gender, Address, MemberID, GroupID) VALUES (p_id, p_first, p_last, p_dob, p_email, p_phone, p_gender, p_address, p_MemberID, p_GroupID) ; 
END $$

# delete_patient
# provide an id to delete from patient table 

CREATE PROCEDURE delete_patient (IN p_id VARCHAR(255)) 
BEGIN
DELETE FROM patient WHERE PatientID = p_id; 
END $$

# update_patient_address

CREATE PROCEDURE update_patient_address(IN p_id VARCHAR(255), IN p_address VARCHAR(255)) 
BEGIN
UPDATE patient SET address = p_address WHERE PatientID = p_id; 
END $$

# new_appointment

CREATE PROCEDURE new_appointment(IN p_id VARCHAR(255),IN p_patientID VARCHAR(255), IN p_staffID VARCHAR(255), IN p_date DATE, IN p_time TIME, IN p_reason VARCHAR(255)) 
BEGIN
INSERT INTO appointment (AppointmentID, PatientID, StaffID, Appointment_Date, Appointment_Time, Reason) VALUES(p_id, p_patientID, p_staffID, p_date, p_time, p_reason);
END $$

# update_payment
-- based on visitID, updates payment status from Unpaid to Paid

CREATE PROCEDURE update_payment(IN p_visitID VARCHAR(255))
BEGIN
DECLARE v_billableAmount INT;
DECLARE v_patientID VARCHAR(255);
SELECT BillableAmount, PatientID INTO v_billableAmount, v_patientID
FROM visit WHERE VisitID = p_visitID;
UPDATE visit SET PaymentStatus = 'Paid' WHERE VisitID = p_visitID;
END $$

# search visit by patient name
-- you provide the patient's first name and last name
-- return the visit details for that patient

CREATE PROCEDURE search_visit(IN p_firstName VARCHAR(255), IN p_lastName VARCHAR(255))
BEGIN
SELECT VisitID, PatientID, s.LastName AS 'Staff Name', Medication, Risk, FollowUp AS 'Follow Up', BillableAmount AS 'Billable Amount', PaymentStatus AS 'Payment Status'
FROM patient pa
JOIN visit v USING (PatientID)
JOIN staff s USING (StaffID)
WHERE pa.FirstName = p_firstName AND pa.LastName = p_lastName;
END $$

DELIMITER ;
