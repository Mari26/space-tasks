create database space;
use space;
drop table clients;
create table clients(
 FIRST_NAME   varchar(50) null,
 LAST_NAME varchar(50)  null,
 PERSONAL_ID varchar(11) null
);
insert into clients(FIRST_NAME,LAST_NAME,PERSONAL_ID)
values('bob','bagdoshvili','abs'),
('ana','badavadze','2222334455'),
('giorgi','giorgadze','12345678803'),
('mari','batiashvili','abcde');
/*task 1 */
select* from clients
where CHAR_LENGTH(PERSONAL_ID) < 11 AND PERSONAL_ID REGEXP '^[A-Za-z]' ;
/*task 2 */
select * from clients
where LAST_NAME like '%shvili%' and (CHAR_LENGTH(LAST_NAME) - CHAR_LENGTH(REPLACE(LAST_NAME,"i",""))) = 3;
/*task 3 */
insert into clients(FIRST_NAME,LAST_NAME,PERSONAL_ID)
values('jimi', 'gudavadze',LEFT(REPLACE(UUID(), '-', ''), 11));
select * from clients;
/*task 4 - js code*/
/*task 5 */
create table Directors(
First_Name varchar(25) not null,
DirectorID int not null,
PRIMARY KEY (DirectorID) 
);
create table Deputies(
First_Name varchar(25) not null,
DeputyID int not null,
DirectorID int,
PRIMARY KEY (DeputyID),
FOREIGN KEY (DirectorID) REFERENCES Directors(DirectorID)
);
create table Headsofdepartments(
First_Name varchar(25) not null,
HeadsofdepartmentID int not null,
DeputyID int,
PRIMARY KEY (HeadsofdepartmentID),
FOREIGN KEY (DeputyID) REFERENCES Deputies(DeputyID)
);
create table Groupleaders(
First_Name varchar(25) not null,
GroupleaderID int not null,
HeadsofdepartmentID int,
PRIMARY KEY (GroupleaderID),
FOREIGN KEY (HeadsofdepartmentID) REFERENCES Headsofdepartments(HeadsofdepartmentID)
);
create table Specialists(
First_Name varchar(25) not null,
SpecialistID int not null,
GroupleaderID int,
PRIMARY KEY (SpecialistID),
FOREIGN KEY (GroupleaderID) REFERENCES Groupleaders(GroupleaderID)
);
select * from directors;
select * from Deputies;
select * from Headsofdepartments;
select * from Groupleaders;
select * from Specialists;




