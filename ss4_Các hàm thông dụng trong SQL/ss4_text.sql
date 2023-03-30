create database ss4_text;
use ss4_text;
create table class_student
(
    class_student_id int not null auto_increment primary key,
    class_student_name varchar(60) not null,
    class_student_start_date datetime not null,
    status_class_student bit
);
select * from class_student;
create table student
(
    student_id int not null auto_increment primary key,
    student_name varchar(30) not null,
    address_student varchar(50),
    phone_student varchar(20),
    status_student bit,
    class_id_student int not null,
    foreign key (class_id_student) references class_student (class_student_id)
);
select * from student;
create table subject_student
(
    subject_student_id int not null auto_increment primary key,
    subject_student_name varchar(30) not null,
    credit_subject_student tinyint not null default 1 check ( credit_subject_student >= 1 ),
    status_subject_student bit default 1
);
select * from subject_student;

create table mark
(
    mark_id int not null auto_increment primary key,
    sub_id int not null,
    student_id int not null,
    mark float default 0 check ( Mark between 0 and 100),
    exam_times tinyint default 1,
    unique (sub_id, student_id),
    foreign key (sub_id) references subject_student (subject_student_id),
    foreign key (student_id) references student (student_id)
);
select * from mark;

insert into class_student
values (1, 'A1', '2008-12-20', 1);
insert into class_student
values (2, 'A2', '2008-12-22', 1);
insert into class_student
values (3, 'B3', current_date, 0);
insert into class_student
values (4,'B5','2012-11-22',1);
insert into class_student
values (5,'B5','2012-11-22',1);

insert into student (student_name, address_student, phone_student, status_student, class_id_student)
values ('Hung', 'Ha Noi', '0912113113', 1, 1);
insert into student (student_name, address_student,status_student, class_id_student)
values ('Hoa', 'Hai phong', 1, 1);
insert into student (student_name, address_student, phone_student, status_student, class_id_student)
values ('Manh', 'HCM', '0123123123', 0, 2);
insert into student (student_name, address_student, phone_student, status_student, class_id_student)
values ('Ngo Hien Thung','Ha Noi', '0912113113', 1, 1);

insert into subject_student
values (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);
insert into mark (sub_id, student_id, mark, exam_times)
values (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);
       
select * from subject_student
where credit_subject_student=(select max(credit_subject_student) from subject_student) ;

select * from subject_student s
inner join mark m on m.sub_id = subject_student_id
where m.mark = (select max(m.mark)from mark);

select s.*, avg(m.mark)
from student s
inner join mark m on m.student_id = s.student_id
group by s.student_id 
order by avg(m.mark) desc;
