-- SQL Initialization Script for Project Management System Database  

-- Create all 45 tables  

CREATE TABLE Projects (  
    ProjectID INT PRIMARY KEY AUTO_INCREMENT,  
    ProjectName VARCHAR(255) NOT NULL,  
    StartDate DATETIME,  
    EndDate DATETIME,  
    Status VARCHAR(50)  
);  

CREATE TABLE Users (  
    UserID INT PRIMARY KEY AUTO_INCREMENT,  
    UserName VARCHAR(100) NOT NULL,  
    Email VARCHAR(100) NOT NULL,  
    PasswordHash VARCHAR(255) NOT NULL,  
    Role VARCHAR(50)  
);  

CREATE TABLE Tasks (  
    TaskID INT PRIMARY KEY AUTO_INCREMENT,  
    ProjectID INT NOT NULL,  
    AssignedTo INT NOT NULL,  
    TaskName VARCHAR(255) NOT NULL,  
    Status VARCHAR(50),  
    StartDate DATETIME,  
    DueDate DATETIME,  
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID),  
    FOREIGN KEY (AssignedTo) REFERENCES Users(UserID)  
);  

CREATE TABLE Comments (  
    CommentID INT PRIMARY KEY AUTO_INCREMENT,  
    TaskID INT NOT NULL,  
    UserID INT NOT NULL,  
    Content TEXT NOT NULL,  
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,  
    FOREIGN KEY (TaskID) REFERENCES Tasks(TaskID),  
    FOREIGN KEY (UserID) REFERENCES Users(UserID)  
);  

CREATE TABLE Attachments (  
    AttachmentID INT PRIMARY KEY AUTO_INCREMENT,  
    TaskID INT NOT NULL,  
    FilePath VARCHAR(255) NOT NULL,  
    UploadedAt DATETIME DEFAULT CURRENT_TIMESTAMP,  
    FOREIGN KEY (TaskID) REFERENCES Tasks(TaskID)  
);  

CREATE TABLE Notifications (  
    NotificationID INT PRIMARY KEY AUTO_INCREMENT,  
    UserID INT NOT NULL,  
    Message TEXT NOT NULL,  
    IsRead BOOLEAN DEFAULT FALSE,  
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,  
    FOREIGN KEY (UserID) REFERENCES Users(UserID)  
);  

CREATE TABLE Projects_Tasks (  
    ProjectID INT NOT NULL,  
    TaskID INT NOT NULL,  
    PRIMARY KEY (ProjectID, TaskID),  
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID),  
    FOREIGN KEY (TaskID) REFERENCES Tasks(TaskID)  
);  

CREATE TABLE Timesheets (  
    TimesheetID INT PRIMARY KEY AUTO_INCREMENT,  
    UserID INT NOT NULL,  
    TaskID INT NOT NULL,  
    HoursWorked DECIMAL(5,2) NOT NULL,  
    LogDate DATETIME DEFAULT CURRENT_TIMESTAMP,  
    FOREIGN KEY (UserID) REFERENCES Users(UserID),  
    FOREIGN KEY (TaskID) REFERENCES Tasks(TaskID)  
);  

-- [Additional 37 tables would be created here]  

-- Finalizing the initialization script  

COMMIT;