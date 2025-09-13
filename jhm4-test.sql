-- Active: 1747455169474@@127.0.0.1@3306@jhm4_test
CREATE DATABASE jhm4_test;
USE jhm4_test;
CREATE TABLE STUDENT (
    SID VARCHAR(10) PRIMARY KEY,
    SNAME VARCHAR(50) NOT NULL,
    SEX CHAR(1),
    DOB DATE,
    CLASS VARCHAR(10)
);

CREATE TABLE COURSE (
    CID VARCHAR(10) PRIMARY KEY,
    CNAME VARCHAR(50) NOT NULL,
    CREDIT INT
);

INSERT INTO STUDENT (SID, SNAME, SEX, DOB, CLASS) VALUES
('S001', '陳大文', 'M', '2006-02-15', '4A'),
('S002', '李小明', 'M', '2005-11-23', '4B'),
('S003', '王美麗', 'F', '2006-05-30', '4A');

INSERT INTO COURSE (CID, CNAME, CREDIT) VALUES
('C001', '中國語文', '4'),
('C002', '數學', '4'),
('C003', '通識教育', '3');

DELETE FROM STUDENT WHERE 'SID' = 'S001';

CREATE TABLE ENROLLMENT (
    SID VARCHAR(10),
    CID VARCHAR(10),
    TERM VARCHAR(50),
    GRADE INT,
    PRIMARY KEY (SID, CID, TERM),
    FOREIGN KEY(SID) REFERENCES STUDENT(SID),
    FOREIGN KEY(CID) REFERENCES COURSE(CID)
);

INSERT INTO ENROLLMENT (SID, CID, TERM, GRADE) VALUES
('S001', 'C001', '2023-24-1', '85'),
('S001', 'C002', '2023-24-1', '92'),
('S002', 'C001', '2023-24-1', '78'),
('S003', 'C002', '2023-24-1', '95');

ALTER TABLE STUDENT MODIFY SNAME VARCHAR(50) NOT NULL;

ALTER TABLE COURSE MODIFY CNAME VARCHAR(50) NOT NULL;

-- 首先創建班級表，因為學生表會引用它
CREATE TABLE Class ( -- 創建班級表
    class_id INT PRIMARY KEY, -- 班級編號（主鍵）
    class_name VARCHAR(50) NOT NULL, -- 班級名稱（不可為空）
    grade INT NOT NULL -- 年級（不可為空）
);

CREATE TABLE Student ( -- 創建學生表
    student_id INT PRIMARY KEY, -- 學生編號（主鍵）
    name VARCHAR(50) NOT NULL, -- 學生姓名（不可為空）
    gender VARCHAR(10), -- 性別
    birthday DATE, -- 出生日期
    class_id INT, -- 班級編號（外鍵）
    FOREIGN KEY (class_id) REFERENCES Class(class_id) -- 外鍵參照班級表的班級編號
);

CREATE TABLE Teacher ( -- 創建教師表
    teacher_id INT PRIMARY KEY, -- 教師編號（主鍵）
    name VARCHAR(50) NOT NULL, -- 教師姓名（不可為空）
    gender VARCHAR(10), -- 性別
    department VARCHAR(50) -- 所屬部門
);

CREATE TABLE Course ( -- 創建課程表
    course_id INT PRIMARY KEY, -- 課程編號（主鍵）
    course_name VARCHAR(100) NOT NULL, -- 課程名稱（不可為空）
    credit INT, -- 學分數
    department VARCHAR(50), -- 所屬部門
    teacher_id INT, -- 授課教師編號（外鍵）
    FOREIGN KEY (teacher_id) REFERENCES Teacher(teacher_id) -- 外鍵參照教師表的教師編號
);

-- 學生與課程的多對多關係（選課）
CREATE TABLE Student_Course ( -- 創建學生選課關聯表
    student_id INT, -- 學生編號
    course_id INT, -- 課程編號
    enrollment_date DATE DEFAULT (CURRENT_DATE), -- 選課日期，預設為當前日期
    PRIMARY KEY (student_id, course_id), -- 複合主鍵
    FOREIGN KEY (student_id) REFERENCES Student(student_id), -- 外鍵參照學生表的學生編號
    FOREIGN KEY (course_id) REFERENCES Course(course_id) -- 外鍵參照課程表的課程編號
);

-- 班級與教師的多對多關係（班導師）
CREATE TABLE Class_Teacher ( -- 創建班級導師關聯表
    class_id INT, -- 班級編號
    teacher_id INT, -- 教師編號
    PRIMARY KEY (class_id, teacher_id), -- 複合主鍵
    FOREIGN KEY (class_id) REFERENCES Class(class_id), -- 外鍵參照班級表的班級編號
    FOREIGN KEY (teacher_id) REFERENCES Teacher(teacher_id) -- 外鍵參照教師表的教師編號
);