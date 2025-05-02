
-- Tabla roles
CREATE TABLE Roles (
    IdRole NUMBER PRIMARY KEY,
    Name VARCHAR2(100)
);

-- Tabla usuarios
CREATE TABLE Users (
    IdUser NUMBER PRIMARY KEY,
    Name VARCHAR2(100),
    Password VARCHAR2(255),
    IdRole NUMBER,
    FOREIGN KEY (IdRole) REFERENCES Roles(IdRole)
);

-- Tabla carreras
CREATE TABLE Career(
  IdCarrer INT PRIMARY KEY,
  Area VARCHAR(100),
  Name VARCHAR(100)
);

-- Tabla traduados
CREATE TABLE Graduates (
    IdGraduate NUMBER PRIMARY KEY, -- IdUser
    IdentityNumber VARCHAR2(20),
    Address VARCHAR2(255),
    Email VARCHAR2(100),
    Phone VARCHAR2(20),
    WorkPhone VARCHAR2(20),
    GraduationYear NUMBER(4),
    IdCarrer NUMBER,
    Category VARCHAR2(50),
    FOREIGN KEY (IdGraduate) REFERENCES Users(IdUser),
    FOREIGN KEY (IdCarrer) REFERENCES Career(IdCarrer)
);

-- Tabla de comunicadores
CREATE TABLE Speakers (
    IdSpeaker NUMBER PRIMARY KEY, -- IdUser
    Address VARCHAR2(255),
    Email VARCHAR2(100),
    Phone VARCHAR2(20),
    WorkPhone VARCHAR2(20),
    Specialty VARCHAR2(100),
    FOREIGN KEY (IdSpeaker) REFERENCES Users(IdUser)
);

-- Tabla cursos
CREATE TABLE Courses (
    IdCourse NUMBER PRIMARY KEY,
    Name_course VARCHAR2(100),
    Description CLOB,
    Date_course DATE,
    Time_course TIMESTAMP,
    Category_course VARCHAR2(50),
    Modality VARCHAR2(50),
    IdSpeaker NUMBER,
    FOREIGN KEY (IdSpeaker) REFERENCES Speakers(IdSpeaker)
);

-- Tabla cursos de un graduado (N a N)
CREATE TABLE Course_Graduate (
    IdCourse NUMBER,
    IdGraduate NUMBER,
    PRIMARY KEY (IdCourse, IdGraduate),
    FOREIGN KEY (IdCourse) REFERENCES Courses(IdCourse),
    FOREIGN KEY (IdGraduate) REFERENCES Graduates(IdGraduate)
);

-- Tabla carrera de cursos  (relación N a N)
CREATE TABLE Career_Course (
    IdCarrer INT,
    IdCourse NUMBER,
    PRIMARY KEY (IdCarrer, IdCourse),
    FOREIGN KEY (IdCarrer) REFERENCES Career(IdCarrer),
    FOREIGN KEY (IdCourse) REFERENCES Courses(IdCourse)
);
