
CREATE TABLE instructor (
  Id int(5) primary key,
  name varchar(15),
  dept_name varchar(15),
  salary int(5));

desc instructor;

insert into instructor values
(10101,'srinivasan','comp.sci',65000),
(12121,'wu','finance',90000),
(15151,'mozart','music',40000),
(22222,'einstein','physics',95000),
(32343,'el said','history',60000),
(33456,'gold','physics',87000),
(45565,'katz','comp.sci',75000),
(58583,'califieri','history',62000),
(76543,'singh','finance',80000),
(76766,'crick','biology',72000),
(83821,'brandt','comp.sci',92000),
(98345,'kim','elec.eng',80000);

select * from instructor;


CREATE TABLE teaches (
  Id int(5),
  course_id varchar(15),
  sec_id int(1),
  semester varchar(15),
  year int(4));
  
desc teaches;

insert into teaches values
(10101,'CS-101',1,'fall',2017),
(10101,'CS-315',1,'spring',2018),
(10101,'CS-347',1,'fall',2017),
(12121,'FIN-201',1,'spring',2018),
(15151,'MU-199',1,'spring',2018),
(22222,'PHY-101',1,'fall',2017),
(32343,'HIS-351',1,'spring',2018),
(45565,'CS-101',1,'spring',2018),
(45565,'CS-319',1,'spring',2018),
(76766,'BIO-101',1,'summer',2017),
(76766,'BIO-301',1,'summer',2018),
(83821,'CS-190',1,'spring',2017),
(83821,'CS-190',2,'spring',2017),
(83821,'CS-319',2,'spring',2018),
(98345,'EE-181',1,'spring',2017);


select * from teaches;

insert into instructor values('10211','Smith','Biology',66000);
select * from instructor;

delete from instructor where id=10211;
select * from instructor;

select * from instructor where dept_name='history';

select * from instructor cross join teaches;

select name from instructor where name like '%wu%';

select name from instructor where salary between 90000 and 100000;

select * from instructor order by salary;

select course_id from teaches where  semester='fall' and year='2017' or semester='spring' and year='2018';





