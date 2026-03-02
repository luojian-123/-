-- SQL Initialization Script for Project Management System Database

-- Creating Tables
CREATE TABLE Users (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    Username VARCHAR(50) NOT NULL,
    Password VARCHAR(50) NOT NULL,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY AUTO_INCREMENT,
    ProjectName VARCHAR(100) NOT NULL,
    StartDate DATE,
    EndDate DATE,
    UserID INT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE Tasks (
    TaskID INT PRIMARY KEY AUTO_INCREMENT,
    TaskName VARCHAR(100) NOT NULL,
    ProjectID INT,
    AssignedTo INT,
    Status ENUM('Pending', 'In Progress', 'Completed') DEFAULT 'Pending',
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID),
    FOREIGN KEY (AssignedTo) REFERENCES Users(UserID)
);

CREATE TABLE Comments (
    CommentID INT PRIMARY KEY AUTO_INCREMENT,
    TaskID INT,
    UserID INT,
    CommentText TEXT,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (TaskID) REFERENCES Tasks(TaskID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- (Add the rest of the 41 tables here...)

-- Inserting Initial Data
INSERT INTO Users (Username, Password) VALUES ('admin', 'admin123');
INSERT INTO Projects (ProjectName, StartDate, EndDate, UserID) VALUES
('Project Alpha', '2026-03-01', '2026-09-01', 1),
('Project Beta', '2026-02-15', '2026-08-15', 1);

INSERT INTO Tasks (TaskName, ProjectID, AssignedTo, Status) VALUES
('Design Database', 1, 1, 'Pending'),
('Develop API', 2, 1, 'In Progress');

INSERT INTO Comments (TaskID, UserID, CommentText) VALUES
(1, 1, 'This is the initial comment on task 1.');

-- (Add initial data for the rest of the tables here...)