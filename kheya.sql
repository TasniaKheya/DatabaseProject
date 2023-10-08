BEGIN
dbms_output.put_line('drop tables');
end;
/


/* Drop Table */

drop table craft;
drop table seller_buyer;
drop table collector_maker;
drop table collector_seller;
drop table craft_maker;
drop table craft_seller;
drop table craft_buyer;
drop table HomeCraftCollector;
drop table weaving;
drop table WeavingTrainer;
drop table trainee;
drop table education;
drop table WomenStudent;
drop table primaryTeacher;
drop table loanTakerProvider;
drop table loanTakerCollector;
drop table loan_provider;
drop table loan_collector;
drop table loan_taker;
drop table Employee;


BEGIN
dbms_output.put_line('create tables');
end;
/

/* Create Table */
create table Employee(
    empID number(3) not null,
    empName varchar(20),
    emp_address varchar(60),
    salary number(7),
    email varchar(20),
    Emp_phone_no number(11),
    primary key(empID)
);
create table HomeCraftCollector(
    no_of_collected_items number(10),
    hcc_id number(3) not null,
    primary key(hcc_id),
    foreign key(hcc_id)  references Employee(empID)
);
create table craft_buyer(
    buyer_name varchar(20),
    buyer_id number(4) not null,
    provided_money number(10) not null,
    primary key(buyer_id)
);
create table craft_seller(
    cs_id number(3) not null,
    collected_money number(10) not null,
    primary key(cs_id),
    foreign key(cs_id) references Employee(empID)
);
create table craft_maker(
    maker_name varchar(20),
    maker_address varchar(60),
    maker_ID number(5) not null,
    earnings number(7),
    maker_phone_no number(11),
    primary key(maker_id)
);
create table collector_seller(
 hcc_id number(7) not null,
cs_id number(6) not null,
 foreign key(hcc_id)  references HomeCraftCollector(hcc_id),
 foreign key(cs_id)  references craft_seller(cs_id)
);
create table collector_maker(
 hcc_id number(7) not null,
maker_ID number(5) not null,
 foreign key(hcc_id)  references HomeCraftCollector(hcc_id),
 foreign key(maker_ID)  references craft_maker(maker_ID)
);
create table seller_buyer(
  cs_id number(3) not null,
  buyer_id number(4) not null,
  foreign key(buyer_id)  references craft_buyer(buyer_id),
  foreign key(cs_id)  references craft_seller(cs_id)
);
create table craft(
    craft_id number(4) not null,
    craft_name varchar(30),
    maker_ID number(5) not null,
    cs_id number(6) not null,
    hcc_id number(7) not null,
    buyer_id number(4) not null,
    primary key(craft_id),
    foreign key(hcc_id)  references HomeCraftCollector(hcc_id),
    foreign key(buyer_id)  references craft_buyer(buyer_id),
    foreign key(cs_id)  references craft_seller(cs_id),
    foreign key(maker_ID)  references craft_maker(maker_ID)
);
create table trainee(
        Tphoneno number(11),
        provided_fee number(5),
        traineeId number(6) not null,
        traineeName varchar(20),
        primary key(traineeId)
);
create table WeavingTrainer(
    Tid number(3) not null,
    primary key(Tid),
    foreign key(Tid) references Employee(empID)
);
create table weaving(
    traineeId number(6) not null,
     Tid number(3) not null,
    foreign key(Tid) references  WeavingTrainer(Tid),
    foreign key(traineeId) references trainee(traineeId)
);
create table primaryTeacher
(
    PEid number(3) not null,
    primary key(PEid),
    foreign key(PEid) references Employee(empID)
);
create table WomenStudent(
    studentId number(5) not null,
    studentName varchar(30),
    eduFee number(5),
    primary key(studentId)
);
create table education(
    PEid number(3) not null,
    studentId number(5) not null,
    foreign key(PEid) references primaryTeacher(PEid),
    foreign key(studentId) references WomenStudent(studentId)
);
create table loan_taker(
    takerID number(5) not null,
    loan_taken_amount number(5),
    loan_provided_amount number(5),
    primary key(takerID)
);

create table loan_collector(
    LCid number(3) not null,
    primary key(LCid),
    foreign key(LCid) references Employee(empID)
);
create table loan_provider(
    Lid number(3) not null,
    primary key(Lid),
    foreign key(Lid) references Employee(empID)
);
create table loanTakerCollector(
takerID number(5) not null,
LCid number(3) not null,
foreign key(takerID) references loan_taker(takerID),
foreign key(LCid) references loan_collector(LCid)
);
create table loanTakerProvider(
takerID number(5) not null,
Lid number(3) not null,
foreign key(takerID) references loan_taker(takerID),
foreign key(Lid) references loan_provider(Lid)
);
BEGIN
dbms_output.put_line('insert data into tables');
end;
/


/*insert data into table */
insert into Employee values(000,'KHEYA','KHULNA',10000,'12@gmail.com',01765298481);
insert into Employee values(001,'ANONNA','DHAKA',8000,'23@gmail.com',01765298482);
insert into Employee values(002,'RENU','CHITTAGONG',10000,'34@gmail.com',01765298483);
insert into Employee values(003,'RENU','BARISAL',10000,'45@gmail.com',01765298484);
insert into Employee values(004,'GITA','COMILLA',9000,'56@gmail.com',01765298485);
insert into Employee values(005,'MITA','SYLHET',10000,'67@gmail.com',01765298486);
insert into Employee values(006,'MITU','NILPHAMARI',7000,'78@gmail.com',01765298487);
insert into Employee values(007,'HAWA','NARAYANGANJ',10000,'89@gmail.com',01765298488);
insert into Employee values(008,'LABONNO','DINAJPUR',10000,'91@gmail.com',01765298489);
insert into Employee values(009,'NABILA','TETULIA',5000,'92@gmail.com',01765298480);
insert into Employee values(010,'OISHI','KHULNA',6000,'93@gmail.com',01765298471);
insert into Employee values(011,'MUMU','DHAKA',7000,'71@gmail.com',01765298472);
insert into Employee values(012,'UMA','DHAKA',9000,'56@gmail.com',01765298473);
insert into Employee values(013,'SUFIA','RAJSHAHI',10000,'29@gmail.com',01765298474);
insert into Employee values(014,'RODELA','TETULIA',5000,'11@gmail.com',01765298180);
insert into Employee values(015,'MAISHA','KHULNA',6000,'22@gmail.com',01765293471);
insert into Employee values(016,'LABIBA','DHAKA',7000,'33@gmail.com',01735298472);
insert into Employee values(017,'JEBA','DHAKA',9000,'51@gmail.com',01764298473);
insert into Employee values(018,'MITHILA','RAJSHAHI',10000,'77@gmail.com',01765398474);
insert into HomeCraftCollector values(10,000);
insert into HomeCraftCollector values(20,001);
insert into HomeCraftCollector values(30,002);
insert into craft_buyer values('KHOKA',1212,1000);
insert into craft_buyer values('BABY',1313,1000);
insert into craft_buyer values('KHEYA',1414,1000);
insert into craft_buyer values('SIAM',1515,1000);
insert into craft_seller values(003,1000);
insert into craft_seller values(004,1000);
insert into craft_seller values(005,1000);
insert into craft_seller values(006,1000);
insert into craft_maker values('REDE','DHAKA',10100,700,01324567890);
insert into craft_maker values('REDEE','DHAKA',10111,500,01324567810);
insert into craft_maker values('RED','DHAKA',10113,600,01324567890);
insert into craft_maker values('RE','DHAKA',10114,400,01324567810);
insert into collector_maker values(000,10100);
insert into collector_maker values(000,10111);
insert into collector_maker values(001,10113);
insert into collector_maker values(002,10113);
insert into seller_buyer values(003,1212);
insert into seller_buyer values(004,1212);
insert into seller_buyer values(005,1414);
insert into seller_buyer values(005,1515);
insert into collector_seller values(000,003);
insert into collector_seller values(000,004);
insert into collector_seller values(001,005);
insert into collector_seller values(002,005);
insert into craft values(1111,'SOKHER_PUTUL',10100,003,000,1212);
insert into craft values(2222,'MATIR_PUTUL',10113,005,001,1515);
insert into trainee values(0123474587,500,323232,'Payel');
insert into trainee values(1123474587,800,323233,'nafisa');
insert into WeavingTrainer values(007);
insert into WeavingTrainer values(008);
insert into WeavingTrainer values(009);
insert into weaving values(323232,007);
insert into weaving values(323232,008);
insert into weaving values(323233,009);
insert into primaryTeacher values(010);
insert into primaryTeacher values(011);
insert into WomenStudent values(10101,'LISA',20000);
insert into WomenStudent values(20202,'JISOO',30000);
insert into education values(010,10101);
insert into education values(010,20202);
insert into education values(011,20202);
insert into loan_taker values(34560,10000,5000);
insert into loan_taker values(34561,20000,7000);
insert into loan_collector values(014);
insert into loan_collector values(015);
insert into loan_provider values(016);
insert into loan_provider values(017);
insert into loanTakerCollector values(34560,014);
insert into loanTakerCollector values(34561,014);
insert into loanTakerProvider values(34560,016);
insert into loanTakerProvider values(34561,016);

BEGIN
dbms_output.put_line('select all data from tables');
end;
/


/* select all from table */
select * from Employee;
select * from HomeCraftCollector;
select * from craft_buyer;
select * from craft_seller;
select * from craft_maker;
select * from collector_seller;
select * from collector_maker;
select * from seller_buyer;
select * from craft;
select * from trainee;
select * from WeavingTrainer;
select * from weaving;
select * from primaryTeacher;
select * from WomenStudent;
select * from education;
select * from loan_taker;
select * from loan_collector;
select * from loan_provider;
select * from loanTakerCollector;
select * from loanTakerProvider;
BEGIN
dbms_output.put_line('describe tables');
end;
/


/*describe table */
describe Employee;
describe craft;


/*alter table*/
ALTER TABLE Employee 
ADD age number(3) ;
describe Employee;
ALTER TABLE Employee
MODIFY age number(4);
describe Employee;
ALTER TABLE Employee
DROP COLUMN age;
describe Employee;
ALTER TABLE Employee 
RENAME COLUMN Emp_phone_no to phoneNo;
describe Employee;



/*update table*/
UPDATE Employee SET phoneNo=01766234561 WHERE empName='HAWA';
UPDATE Employee SET emp_address='KUSTIA' WHERE empID=008;
select * from Employee;



/*delete data from table*/
DELETE FROM Employee WHERE empID=013;
select * from Employee;



/*select distinct data from table*/
SELECT DISTINCT(emp_address) FROM employee;



/*use of between */
SELECT empID,empName
FROM employee
WHERE salary BETWEEN 7000 AND 10000;




/*use of not between */
SELECT empID,empName
FROM employee
WHERE salary NOT BETWEEN 7000 AND 10000;


/*use of IN */
SELECT empID,empName
FROM employee
WHERE salary IN (7000, 10000);


/*use of LIKE*/
SELECT  buyer_name,buyer_id
FROM craft_buyer
WHERE buyer_name LIKE '%A';


/*use of OrderBy*/
select earnings,maker_ID,maker_name
from craft_maker
order by earnings;
SELECT salary,empID,empName
FROM employee
ORDER BY salary, emp_address desc;


/*use of Condition*/
SELECT empName,empID FROM employee 
WHERE salary>7000;
SELECT empName,empID
FROM employee
WHERE salary=5000 OR salary=10000;


/*use of Aggregate functions*/
describe craft_maker;
SELECT COUNT(*), SUM(earnings), AVG(NVL(earnings,0))
FROM craft_maker;
describe craft_seller;
SELECT COUNT(*), SUM(collected_money), AVG(NVL(collected_money,0))
FROM craft_seller;
SELECT COUNT(emp_address), COUNT(DISTINCT emp_address), COUNT(ALL emp_address)
FROM employee;


/*use of group by*/
SELECT PEid, COUNT(studentId) 
FROM education
GROUP BY PEid;
SELECT hcc_id, COUNT(cs_id)
FROM collector_seller
WHERE hcc_id > 0
GROUP BY hcc_id;


/*use of having*/
SELECT buyer_id, COUNT(cs_id) 
FROM  seller_buyer
GROUP BY buyer_id
HAVING COUNT(cs_id)>0 ;



/*use of nested query*/
select max(salary) as MaxSalary from employee ;
select max(salary) as secondMaxSalary from employee where salary not in(
        select max(salary) from employee
);
select max(salary) as thirdMaxSalary from employee where salary < (
    select max(salary) from employee where salary not in(
        select max(salary) from employee
        )
);



/*use of intersect*/
SELECT empID, empName
	FROM employee
	WHERE salary>6000
	INTERSECT
	SELECT e.empID, e.empName
	FROM employee e
	WHERE e.empID IN 	(SELECT p.PEid
					FROM primaryTeacher p);



/*use of minus*/
SELECT empID, empName
	FROM employee
	WHERE salary>6000
	MINUS
	SELECT e.empID, e.empName
	FROM employee e
	WHERE e.empID IN 	(SELECT p.PEid
					FROM primaryTeacher p);



/*use of union*/
SELECT r.empname
FROM employee r,HomeCraftCollector h
WHERE r.empid=h.hcc_id
UNION 
SELECT e.empname
FROM craft_seller o, employee e
WHERE o.cs_id = e.empid;
describe Organization;


/*Join Operation*/
/*This will show how much money is collected by collectors*/
/*Equi JOin*/
SELECT t.lcid, p.loan_provided_amount as collected_money
	FROM loanTakerCollector t,loan_taker p
	WHERE t.takerID=p.takerID;


SELECT t.lid, p.loan_taken_amount as provided_money
	FROM loanTakerProvider t JOIN loan_taker p
	using (takerID);


SELECT * FROM loanTakerProvider NATURAL JOIN loan_taker;

SELECT loanTakerProvider.lid,loan_taker.loan_provided_amount FROM loanTakerProvider CROSS JOIN loan_taker;


SELECT e.empName, l.lcid
	FROM Employee e LEFT OUTER JOIN loan_collector l
	ON e.empID = l.lcid;

SELECT l.lid,e.empName
	FROM loan_provider l RIGHT OUTER JOIN Employee e
	ON e.empID = l.lid;
/*They are same*/
SELECT l.lid,e.empName
	FROM loan_provider l FULL OUTER JOIN Employee e
	ON e.empID = l.lid;

/*If two employee have same  name it will show their id*/
SELECT e.empName ,m.empID 
	FROM employee e JOIN employee m
    on e.empName=m.empName;






