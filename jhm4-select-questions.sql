-- JHM4 資料庫 SELECT 語句練習題 (JHM4 Database SELECT Statement Exercises)
USE jhm4_test;

-- 基礎查詢 (Basic Queries)
-- =====================================================

-- 1. 簡單查詢：查詢所有學生的姓名和性別 (Simple query: Query all students' names and genders)
-- 你的答案 (Your answer):
SELECT name, gender FROM Student;

-- 2. 條件查詢：查詢所有男學生的資料 (Conditional query: Query data for all male students)
-- 你的答案 (Your answer):
SELECT name, gender FROM Student WHERE gender LIKE 'M';

-- 3. 排序查詢：查詢所有學生的資料，按出生日期由早到晚排序 (Sorted query: Query all student data, ordered by birth date from earliest to latest)
-- 你的答案 (Your answer):
SELECT * FROM `Student` ORDER BY birthday;

-- 4. 限制結果數量：查詢前3名最年輕的學生資料 (Limited result query: Query data for the 3 youngest students)
-- 你的答案 (Your answer):
SELECT * FROM `Student` ORDER BY birthday DESC LIMIT 3;

-- 中級查詢 (Intermediate Queries)
-- =====================================================

-- 5. 單表聚合函數：統計總共有多少名學生 (Single-table aggregate function: Count the total number of students)
-- 你的答案 (Your answer):
SELECT COUNT(*) FROM `Student`;

-- 6. 分組統計：統計每個年級有多少個班級 (Group statistics: Count how many classes there are in each grade)
-- 你的答案 (Your answer):
SELECT grade, COUNT(*) FROM `Class` GROUP BY grade;

-- 7. 條件統計：統計每個性別的學生人數 (Conditional statistics: Count the number of students for each gender)
-- 你的答案 (Your answer):
SELECT gender, COUNT(*) FROM `Student` GROUP BY gender;

-- 8. 範圍查詢：查詢學分數在3到4之間的課程資料 (Range query: Query courses with credits between 3 and 4)
-- 你的答案 (Your answer):
SELECT * FROM `Course` WHERE credit = 3 or credit = 4;

-- 表連接查詢 (JOIN Queries)
-- =====================================================

-- 9. 內連接查詢：查詢所有學生的姓名及其所屬班級名稱 (Inner join query: Query all students' names and their class names)
-- 你的答案 (Your answer):
SELECT s.name, cl.class_name FROM `Student` s JOIN `Class` cl on s.class_id = cl.class_id;

-- 10. 多表連接：查詢所有課程的名稱、學分數及授課教師姓名 (Multi-table join: Query all course names, credits, and teacher names)
-- 你的答案 (Your answer):
SELECT c.course_name, c.credit, t.name FROM `Course` c JOIN `Teacher` t ON c.teacher_id = t.teacher_id;

-- 11. 複雜連接查詢：查詢每個學生的姓名、班級名稱及其選修的課程名稱 (Complex join query: Query each student's name, class name, and their enrolled course names)
-- 你的答案 (Your answer):
SELECT s.name, cl.class_name, c.course_name FROM `Student` s JOIN `Class` cl ON s.class_id = cl.class_id JOIN `Student_Course` sc ON

-- 12. 左連接查詢：查詢所有教師及其負責的班級（包括沒有負責班級的教師） (Left join query: Query all teachers and their responsible classes (including teachers with no classes))
-- 你的答案 (Your answer):


-- 高級查詢 (Advanced Queries)
-- =====================================================

-- 13. 子查詢：查詢選修課程數量最多的學生姓名 (Subquery: Query the names of students who have enrolled in the most courses)
-- 你的答案 (Your answer):


-- 14. 複雜統計查詢：統計每個班級的學生人數和平均年齡（以2024年為基準） (Complex statistical query: Count the number of students and average age for each class (using 2024 as reference))
-- 你的答案 (Your answer):


-- 15. 分組過濾：查詢選修課程數量超過2門的學生姓名和選修課程數 (Group filtering: Query names and course counts of students who have enrolled in more than 2 courses)
-- 你的答案 (Your answer):


-- 16. 存在性查詢：查詢沒有學生選修的課程 (Existence query: Query courses that have no enrolled students)
-- 你的答案 (Your answer):


-- 17. 複雜條件查詢：查詢同時選修「數學」和「物理」的學生姓名 (Complex conditional query: Query names of students who have enrolled in both "Mathematics" and "Physics")
-- 你的答案 (Your answer):


-- 18. 排名查詢：查詢每個部門教師數量最多的前2個部門 (Ranking query: Query the top 2 departments with the most teachers)
-- 你的答案 (Your answer):


-- 綜合應用題 (Comprehensive Questions)
-- =====================================================

-- 19. 複雜業務查詢：查詢「張志明」老師教授的課程中，每門課程有多少名學生選修，並按選修人數降序排列 (Complex business query: Query how many students enrolled in each course taught by teacher "Zhang Zhiming", ordered by enrollment count in descending order)
-- 你的答案 (Your answer):


-- 20. 多層子查詢：查詢選修了「數學系」所有課程的學生姓名 (Multi-level subquery: Query names of students who have enrolled in all courses from the "Mathematics Department")
-- 你的答案 (Your answer):


-- 21. 時間計算查詢：查詢每個年級學生的平均年齡（精確到小數點後兩位，以2024年1月1日為基準） (Time calculation query: Query the average age of students in each grade (accurate to two decimal places, using January 1, 2024 as reference))
-- 你的答案 (Your answer):


-- 22. 綜合統計報表：生成一份報表，顯示每個班級的詳細資訊：班級名稱、年級、學生總數、男女學生比例、該班學生選修的課程總數 (Comprehensive statistical report: Generate a report showing detailed information for each class: class name, grade, total students, male-to-female ratio, and total courses enrolled by students in that class)
-- 你的答案 (Your answer):