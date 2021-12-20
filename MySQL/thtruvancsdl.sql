USE quanlysinhvien;

SELECT * FROM Student;

SELECT *
FROM Student
WHERE Status = false;

SELECT * 
FROM subject
where credit < 10;

-- Join 2 bảng Student và Class
SELECT S.StudentId, S. StudentName, C.ClassName
FROM Student S join Class C on S.ClassId = C.ClassID;

-- Sử dụng câu lệnh Where C.ClassName ='A1' để hiển thị danh sách học viên lớp A1
SELECT S.StudentId, S.StudentName, C.ClassName
FROM Student S join Class C on S.ClassId = C.ClassID
WHERE C.ClassName = 'A1';

-- Hiển thị tất cả các điểm đang có của học viên
SELECT S.StudentId, S.StudentName, Sub.SubName, M.Mark
FROM Student S join Mark M on S.StudentId = M.StudentId join Subject Sub on M.SubId = Sub.SubId;

-- Sử dụng câu lệnh Where để hiển thị điểm môn CF của các học viên
SELECT S.StudentId, S.StudentName, Sub.SubName, M.Mark
FROM Student S join Mark M on S.StudentId = M.StudentId join Subject Sub on M.SubId = Sub.SubId
WHERE Sub.SubName = 'CF';

