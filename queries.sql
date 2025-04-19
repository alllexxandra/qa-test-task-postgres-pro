
 select s_id, name
 from students s
 where s_id not in(
 select s_id 
 from exams
 )
 
 
 select s_id, name, count(*) as num_exams
 from students s
 join exams e using(s_id)
 group by s_id
 
 
 
 select c_no, title, avg(score) as avg_score
 from courses c
 join exams e using (c_no)
 group by c_no 
 order by avg_score desc
 
 
 -- с учетом курсов без экзаменов
 select c_no, title, coalesce(avg(score), 0) as avg_score
 from courses c
 left join exams e using (c_no)
 group by c_no 
 order by avg_score desc
 
 
 call insert_courses(1);
 call insert_students(3);
 call insert_exam();
 
 
 insert into courses (title, hours) 
 select concat('course', round(random() * 1000)), round(random() * 200) + 100
 from generate_series(1, 5)

 
 insert into students (name, start_year) 
 select concat('student', round(random() * 1000)), round(random() * 15) + 2010
 from generate_series(1, 5)
 

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