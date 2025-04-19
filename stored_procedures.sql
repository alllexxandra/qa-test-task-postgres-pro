-- DROP PROCEDURE public.insert_courses(int4);

CREATE OR REPLACE PROCEDURE public.insert_courses(IN num integer)
 LANGUAGE plpgsql
AS $procedure$
	BEGIN
		 insert into courses (title, hours) 
		 select concat('course', round(random() * 1000)), round(random() * 200) + 100
		 from generate_series(1, num);
	END;
$procedure$
;


-- DROP PROCEDURE public.insert_exam();

CREATE OR REPLACE PROCEDURE public.insert_exam()
 LANGUAGE plpgsql
AS $procedure$
	BEGIN
		 with students_exams as(
		 select s_id, c_no 
		 from students s, courses c
			 where (s_id, c_no ) not in (
				 select s_id, c_no
				 from exams e 
			 )
			 order by random()
			 limit 1
		 )
		 insert into exams (s_id, c_no, score) 
		 select s_id, c_no, round(random() * 4) + 1
		 from students_exams;
	END;
$procedure$
;


-- DROP PROCEDURE public.insert_students(int4);

CREATE OR REPLACE PROCEDURE public.insert_students(IN num integer)
 LANGUAGE plpgsql
AS $procedure$
	BEGIN
		insert into students (name, start_year) 
		 select concat('student', round(random() * 1000)), round(random() * 15) + 2010
		 from generate_series(1, num);
	END;
$procedure$
;
