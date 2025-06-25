
-- Create Tables
CREATE TABLE Authors (
    AuthorID INTEGER PRIMARY KEY,
    Name TEXT NOT NULL,
    BirthYear INTEGER
);

CREATE TABLE Books (
    BookID INTEGER PRIMARY KEY,
    Title TEXT NOT NULL,
    AuthorID INTEGER,
    PublishedYear INTEGER DEFAULT 2000,
    ISBN TEXT UNIQUE,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

CREATE TABLE Members (
    MemberID INTEGER PRIMARY KEY,
    Name TEXT NOT NULL,
    Email TEXT,
    JoinDate DATE DEFAULT CURRENT_DATE
);

-- Insert Data
INSERT INTO Authors (AuthorID, Name, BirthYear)
VALUES (1, 'J.K. Rowling', 1965),
       (2, 'George Orwell', 1903),
       (3, 'Unknown Author', NULL);

INSERT INTO Books (BookID, Title, AuthorID, PublishedYear, ISBN)
VALUES (101, 'Harry Potter and the Sorcerer''s Stone', 1, 1997, '9780439554930'),
       (102, '1984', 2, 1949, '9780451524935'),
       (103, 'Mystery Book', 3, DEFAULT, NULL);

INSERT INTO Members (MemberID, Name, Email)
VALUES (1, 'Alice', 'alice@example.com'),
       (2, 'Bob', NULL),
       (3, 'Charlie', 'charlie@example.com');

-- Update Data
UPDATE Members
SET Email = 'bob@example.com'
WHERE Name = 'Bob';

UPDATE Books
SET PublishedYear = 2001
WHERE BookID = 103 AND PublishedYear = 2000;

-- Delete Data
DELETE FROM Members
WHERE Email IS NULL;

DELETE FROM Books
WHERE ISBN IS NULL;
