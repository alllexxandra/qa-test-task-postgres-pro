create table students(
s_id serial primary key,
name varchar(50) not null,
start_year integer not null
)


create table courses(
c_no serial primary key,
title varchar(100) not null,
hours integer not null
)

 create table exams(
 s_id integer references students,
 c_no integer references courses,
 score numeric not null
 )