USE quanlysinhvien;
INSERT INTO Class
VALUES (null, 'A1', '2008-12-20', 1);
INSERT INTO Class
VALUES (null ,'A1', '2008-12-22',1);
INSERT INTO Class
VALUES (null, 'B3', current_date, 0);

INSERT INTO student
VALUES (null, 'hùng', 'hà nội', '0357482312', 1, 8);
INSERT INTO student
VALUES (null, 'đại', 'hà nội', '0964341296', 1, 7 );
INSERT INTO student
VALUES (null, 'mạnh', 'HCM', '0123456987', 1, 9 );

INSERT INTO subject
VALUES (null, 'CF', 5, 1);
INSERT INTO subject
VALUES (null, 'C', 6, 1);
INSERT INTO subject
VALUES (null, 'HDJ', 5, 1);
INSERT INTO subject
VALUES (null, 'RDBMS', 10, 1);

INSERT INTO Mark 
VALUES (null, 1, 1, 8, 1);
INSERT INTO Mark
VALUES (null, 1, 10, 2, 2);
INSERT INTO Mark
VALUES (null, 2, 1, 12, 1);
INSERT INTO Mark (SubId, StudentId, Mark, ExamTimes)
VALUES ( 1, 1, 8, 1),
       ( 1, 2, 10, 2),
       ( 2, 1, 12, 1);
