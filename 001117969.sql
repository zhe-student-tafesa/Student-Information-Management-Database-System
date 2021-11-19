/*
Name:Zhe Zhang
Id:001117969
*/

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema 001117969
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `001117969` ;
USE `001117969` ;




-- -----------------------------------------------------
-- Table `001117969`.`school`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `001117969`.`school` ;

CREATE TABLE IF NOT EXISTS `001117969`.`school` (
  `SchoolName` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NULL,
  `Phone` VARCHAR(15) NULL,
  `Address` VARCHAR(45) NULL,
  PRIMARY KEY (`SchoolName`))
ENGINE = InnoDB;
/*
   001117969 insert value
   SchoolName` Norwood Primary School,
  `Email` 789456abc@gmail.com
  `Phone` 0415085145,
  `Address` 37 Osmond Terrace, Norwood SA 5067
  
*/
INSERT INTO  school  (SchoolName,Email  ,Phone,Address)VALUES# 注意中文字符
('Norwood Primary School',  '789456abc@gmail.com', '0415085145' , '37 Osmond Terrace, Norwood SA 5067');
select * from  school;




-- -----------------------------------------------------
-- Table `001117969`.`student`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `001117969`.`student` ;

CREATE TABLE IF NOT EXISTS `001117969`.`student` (
  `StudentID` VARCHAR(8) NOT NULL,
  `BirthDate` DATE NULL,
  `Email` VARCHAR(45) NULL,
  `FirstName` VARCHAR(30) NULL,
  `LastName` VARCHAR(30) NULL,
  `Gender` VARCHAR(1) NULL,
  `Nationality` VARCHAR(20) NULL,
  `PhoneNumber` VARCHAR(15) NULL,
  `School_SchoolName` VARCHAR(45) NOT NULL,
  `StudentDateOfEnrolmenCampus` DATE NULL,
  PRIMARY KEY (`StudentID`),
  INDEX `fk_Students_School1_idx` (`School_SchoolName` ASC) VISIBLE,
  CONSTRAINT `fk_Students_School1`
    FOREIGN KEY (`School_SchoolName`)
    REFERENCES `001117969`.`school` (`SchoolName`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

/*
   001117969 insert student value
   
  `StudentID` VARCHAR(8) NOT NULL,
  `BirthDate` DATE NULL,
  `Email` VARCHAR(45) NULL,
  `FirstName` VARCHAR(30) NULL,
  `LastName` VARCHAR(30) NULL,
  `Gender` VARCHAR(1) NULL,
  `Nationality` VARCHAR(20) NULL,
  `PhoneNumber` VARCHAR(15) NULL,
  `School_SchoolName` VARCHAR(45) NOT NULL,
  `StudentDateOfEnrolmenCampus` DATE NULL,
  
*/
INSERT INTO  student  ( StudentID,BirthDate,Email,FirstName,LastName,Gender,Nationality,PhoneNumber,School_SchoolName,StudentDateOfEnrolmenCampus)VALUES# 注意中文字符
('00117969',  '1989-06-18', 'zhe.zhang.qa21262@gmail.com' , 'Zhe','Zhang','M','China','0415085172','Norwood Primary School','2020-01-14'),
('00000001',  '1989-01-11', 'heath.barratt@tafesa.edu.au' , 'Heath','Barratt','M','Australia','0415085911','Norwood Primary School','2020-01-14'),
('00000002',  '1988-02-12', 'sreeja.jayasree@tafesa.edu.au' , 'Sreeja','Jayasree','F','India','041508500','Norwood Primary School','2020-01-14'),
('00000003',  '1989-03-13', 'paul.kasperski@tafesa.edu.au' , 'Paul','Kasperski','M','Australia','0415085119','Norwood Primary School','2020-01-14'),
('00000004',  '1989-04-14', 'melissa.huikeshoven@tafesa.edu.au' , 'Melissa','Huikeshoven','M','Australia','0415085888','Norwood Primary School','2020-01-14')
;
select * from  student;
# how to change the values in the query
select * from  student
where StudentID='00000002';








-- -----------------------------------------------------
-- Table `001117969`.`teacher`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `001117969`.`teacher` ;

CREATE TABLE IF NOT EXISTS `001117969`.`teacher` (
  `TeacherID` VARCHAR(8) NOT NULL,
  `FirstName` VARCHAR(30) NULL,
  `LastName` VARCHAR(30) NULL,
  `Email` VARCHAR(45) NULL,
  `Phone` VARCHAR(15) NULL,
  `School_SchoolName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`TeacherID`),
  INDEX `fk_Teachers_School1_idx` (`School_SchoolName` ASC) VISIBLE,
  CONSTRAINT `fk_Teachers_School1`
    FOREIGN KEY (`School_SchoolName`)
    REFERENCES `001117969`.`school` (`SchoolName`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
/*
insert Teacher value
*/
INSERT INTO   teacher  (TeacherID,FirstName,LastName,Email,Phone,School_SchoolName)VALUES# 注意中文字符
 ('00117000','Frank','Annese','frank.annese@tafesa.edu.au', '+61872103415','Norwood Primary School')
,('00117001','Julie','Ruiz','julie.ruiz@tafesa.edu.au', '+61872103000','Norwood Primary School')
,('00117002','Greg','Lynch','greg.lynch@tafesa.edu.au', '+61872103911','Norwood Primary School')
;
select * from teacher ;
# how to change the values in the query
select * from  teacher
where TeacherID='00117002';





-- -----------------------------------------------------
-- Table `001117969`.`subject`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `001117969`.`subject` ;

CREATE TABLE IF NOT EXISTS `001117969`.`subject` (
  `Name` VARCHAR(4) NOT NULL,
  `Cost` FLOAT(6,2) NULL,
  `Duration` SMALLINT NULL,
  `QuantityOfAssessmentItems` SMALLINT NULL,
  `Description` TEXT(100) NULL,
  `teacher_CoordinatorID` VARCHAR(8) NOT NULL,
  PRIMARY KEY (`Name`),
  INDEX `fk_Subjects_Teachers_idx` (`teacher_CoordinatorID` ASC) VISIBLE,
  CONSTRAINT `fk_Subjects_Teachers`
    FOREIGN KEY (`teacher_CoordinatorID`)
    REFERENCES `001117969`.`teacher` (`TeacherID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

/*
insert Subject value
*/
INSERT INTO    subject (Name,Cost,Duration,QuantityOfAssessmentItems,Description,teacher_CoordinatorID)VALUES# 注意中文字符
   ('Math',600.02,  100,6, 'Add, subtract, multiply and divide within 100','00117000');
INSERT INTO    subject (Name,Cost,Duration,QuantityOfAssessmentItems,Description,teacher_CoordinatorID)VALUES# 注意中文字符
   ('4DBB',600.02,  100,6, 'Use MySQL to query and edit databases','00117000');
INSERT INTO    subject (Name,Cost,Duration,QuantityOfAssessmentItems,Description,teacher_CoordinatorID)VALUES# 注意中文字符

   ('4JSB',300.02,  50, 5, 'Use JavaScript to write a verification page',  '00117001')
 , ('3PRB',280.02,  100,4, 'Learn python basic programming',               '00117001')
 , ('4CMS',600.02,  100,6, 'Learn how to use WordPress by yourself',		 '00117002')
 ;
select * from subject;
# how to change the values in the query
select * from  subject
where Name='3PRB';





-- -----------------------------------------------------
-- Table `001117969`.`subjecthasstudent`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `001117969`.`subjecthasstudent` ;

CREATE TABLE IF NOT EXISTS `001117969`.`subjecthasstudent` (
  `Subject_Name` CHAR(4) NOT NULL,
  `Student_StudentsID` VARCHAR(8) NOT NULL,
  `StudentGrade` VARCHAR(4) NULL,
  `StudentResult` SMALLINT NULL,
  `DateGradeResulted` DATE NULL,
  `StudentDateOfEnnrolmenSubject` DATE NULL,
  PRIMARY KEY (`Subject_Name`, `Student_StudentsID`),
  INDEX `fk_Subjects_has_Students_Students1_idx` (`Student_StudentsID` ASC) VISIBLE,
  INDEX `fk_Subjects_has_Students_Subjects1_idx` (`Subject_Name` ASC) VISIBLE,
  CONSTRAINT `fk_Subjects_has_Students_Subjects1`
    FOREIGN KEY (`Subject_Name`)
    REFERENCES `001117969`.`subject` (`Name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Subjects_has_Students_Students1`
    FOREIGN KEY (`Student_StudentsID`)
    REFERENCES `001117969`.`student` (`StudentID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

/*
insert 
Each student will need results/grades for at least 3 subjects (minimum 15 records)

Student gender  (M/F)
Student grade (Options are: Pass, Fail, Cred, Dist, Wdrw, NS etc. )
Student result  (0-100)
Duration of the subject (in hours - max hours is 999 hours )
Cost of the subject (max cost is $9999.99)
Quantity of assessment items for the subject (max quantity is 99)
Student ID is an 8 digit number (note: leading zeros will not be retained in INT)
Teacher ID is an 8 digit number (note: leading zeros will not be retained in INT)
School name is used to identify schools

*/
INSERT INTO     subjecthasstudent  (Subject_Name,Student_StudentsID,StudentGrade,StudentResult,DateGradeResulted,StudentDateOfEnnrolmenSubject)VALUES# 注意中文字符
				('Math','00117969','Pass',100,'2020-12-10','2020-9-10');
INSERT INTO     subjecthasstudent  (Subject_Name,Student_StudentsID,StudentGrade,StudentResult,DateGradeResulted,StudentDateOfEnnrolmenSubject)VALUES# 注意中文字符
				('Math','00000001','Pass',90,'2020-12-10','2020-9-10')
			    ,('Math','00000002','Pass',89,'2020-12-10','2020-9-10')
                ,('Math','00000003','Pass',70,'2020-12-10','2020-9-10')
                ,('Math','00000004','Fail',50,'2020-12-10','2020-9-10')
                ;
INSERT INTO     subjecthasstudent  (Subject_Name,Student_StudentsID,StudentGrade,StudentResult,DateGradeResulted,StudentDateOfEnnrolmenSubject)VALUES# 注意中文字符
				('4DBB','00117969','Pass',90,'2020-12-10','2020-9-10')
                ,('4DBB','00000001','Pass',70,'2020-12-10','2020-9-10')
			    ,('4DBB','00000002','Pass',69,'2020-12-10','2020-9-10')
                ,('4DBB','00000003','Pass',70,'2020-12-10','2020-9-10')
                ,('4DBB','00000004','Pass',80,'2020-12-10','2020-9-10')
                ;                
INSERT INTO     subjecthasstudent  (Subject_Name,Student_StudentsID,StudentGrade,StudentResult,DateGradeResulted,StudentDateOfEnnrolmenSubject)VALUES# 注意中文字符
				('4JSB','00117969','Pass',99,'2020-10-30','2020-9-10')
                ,('4JSB','00000001','Wdrw',null,'2020-10-30','2020-9-10')
			    ,('4JSB','00000002','Pass',66,'2020-10-30','2020-9-10')
                ,('4JSB','00000003','Pass',77,'2020-10-30','2020-9-10')
                ,('4JSB','00000004','Pass',88,'2020-10-30','2020-9-10')
                ;  
INSERT INTO     subjecthasstudent  (Subject_Name,Student_StudentsID,StudentGrade,StudentResult,DateGradeResulted,StudentDateOfEnnrolmenSubject)VALUES# 注意中文字符
				('3PRB','00117969','Pass',99,'2020-10-30','2020-9-10')
                ,('3PRB','00000001','Pass',95,'2020-10-30','2020-9-10')
			    ,('3PRB','00000002','Pass',86,'2020-10-30','2020-9-10')
                ,('3PRB','00000003','Pass',97,'2020-10-30','2020-9-10')
                ,('3PRB','00000004','Pass',98,'2020-10-30','2020-9-10')
                ; 
INSERT INTO     subjecthasstudent  (Subject_Name,Student_StudentsID,StudentGrade,StudentResult,DateGradeResulted,StudentDateOfEnnrolmenSubject)VALUES# 注意中文字符
				('4CMS','00117969','Pass',79,'2020-12-10','2020-9-10')
                ,('4CMS','00000001','Wdrw',null,'2020-12-10','2020-9-10')
			    ,('4CMS','00000002','Fail',40,'2020-12-10','2020-9-10')
                ,('4CMS','00000003','Wdrw',null,'2020-12-10','2020-9-10')
                ,('4CMS','00000004','Fail',51,'2020-12-10','2020-9-10')
                ; 
select * from subjecthasstudent;                
# how to change the values in the query
select * from  subjecthasstudent
where Subject_Name='3PRB';  




/*
Results of a student 
:name, subject name, subject description, result and grade.
student  AS stu
subject AS sub
subjecthasstudent As SubHasStu
*/
# how to change the query for another student: only need to change  stu.StudentID in where statement

SELECT 
    CONCAT(stu.FirstName, ' ', stu.LastName),
    sub.Name,
    sub.Description,
    SubHasStu.StudentResult,
    SubHasStu.StudentGrade
FROM
    student AS stu
        INNER JOIN
    subjecthasstudent AS SubHasStu ON stu.StudentID = SubHasStu.Student_StudentsID
        INNER JOIN
    subject AS sub ON SubHasStu.Subject_Name = sub.Name
WHERE
    stu.StudentID = '00117969';
        
                
                
/*
Grades in a subject :  subject name, student name, the result and the grade. 
*/   
# how to change the query for another subject: only need to change SubHasStu.Subject_Name in where statement
SELECT 
    SubHasStu.Subject_Name AS subjectName,
    CONCAT(stu.FirstName, ' ', stu.LastName) AS studentName,
    SubHasStu.StudentResult,
    SubHasStu.StudentGrade
FROM
    student AS stu
        INNER JOIN
    subjecthasstudent AS SubHasStu ON stu.StudentID = SubHasStu.Student_StudentsID
WHERE
    SubHasStu.Subject_Name = '3PRB'
ORDER BY SubHasStu.StudentResult DESC;

/*
Age of a student
1. Identifies the site(s) visited when developing the query (ie reference the site I visited:
    https://wiki.jikexueyuan.com/project/mysql/useful-functions/time-functions.html
2.Demonstrates how the age is calculated (ie the formula)  
	(now year)- (BirthDate year)
3. includes sample data that calculates your age based on a date near the submission date of the exercise.   (include the expected result) 
	2021-1989(1989-06-18)=32
4.confirms you tested, verified and the query returned the same value as your calculation 
	Yes
5.explains how (ie the procedure) to change the query for another student
	use: where StudentID=*** or  [where FirstName='***' and LastName ='***'] ;
*/    
 select  CONCAT(FirstName, ' ', LastName) As Name, YEAR(NOW()) - YEAR(BirthDate ) As Age
 from student
 where FirstName='zhe' and LastName ='zhang';
 
 
 
 /*
 The Highest Result:  Use an aggregate function 
  the highest result for all records
 */
 # the highest result for all records is 100.
 # a query result:100
select max(StudentResult) 
from subjecthasstudent;



 /*
 The Lowest Result:  Use an aggregate function 
  the Lowest result for all records
 */
 # the Lowest result for all records is 40.
 # a query result:40
select min(StudentResult) 
from subjecthasstudent;    




/*
Alter the table structure – for Student’s language spoken at home
增加一个新列（新的属性）， 修改新列的值
*/
ALTER TABLE student ADD column languageSpokenAtHome VARCHAR(20);
UPDATE student 
SET 
    languageSpokenAtHome = 'Japanese'
WHERE
    StudentID = '00000001';




/*
Change A Subject Coordinator
4CMS original  Coordinator：Greg Lynch，ID：'00117002'

4CMS  new subject coordinator：Frank Annese，ID='00117000',
*/
update  subject
set  teacher_CoordinatorID='00117000'
where teacher_CoordinatorID='00117002';


/*
Delete a teacher:   name:Greg Lynch，
					ID：'00117002'

*/
delete from teacher
where TeacherID='00117002';



                
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
