
create table employee (
employee_id int not null,
name varchar(50) not null,
gender int,
primary key (employee_id)
);

create table receptionist (
receptionist_id int,
name varchar(50) not null,
shift varchar(50),
primary key (receptionist_id)
);


create table department (
id int,
block int,
depart_name varchar(50) not null,
head_doctor int,
primary key (id)
);


