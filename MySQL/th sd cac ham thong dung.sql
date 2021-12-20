USE QuanLySinhVien;

--  Sử dụng hàm count để hiển thị số lượng sinh viên ở từng nơi
SELECT Address, COUNT(studentId) as 'sl học viên'
FROM Student
group by Address;

--  Tính điểm trung bình các môn học của mỗi học viên bằng cách sử dụng hàm AVG
SELECT S.studentID, S.studentName, AVG(mark)
FROM student S join Mark M on S.studentID = M.StudentID
GROUP by S.studentID, S.studentName;

--  Hiển thị những bạn học viên co điểm trung bình các môn học lớn hơn 15
-- Đầu tiên hiển thị điểm trung bình các môn học của mỗi học viên
SELECT S.StudentId, S.StudentName, avg(Mark)
FROM Student S join Mark M on S.StudentId = M.StudentId
Group by S.StudentID, S.StudentName
Having avg(Mark) > 15;

-- Hiển thị thông tin các học viên có điểm trung bình lớn nhất.
SELECT S.StudentId, S.StudentName, AVG(Mark)
FROM Student S join Mark M on S.StudentId = M.StudentId
GROUP BY S.StudentId, S.StudentName
HAVING AVG(Mark) >= ALL (SELECT AVG(Mark) FROM Mark GROUP BY Mark.StudentId);
