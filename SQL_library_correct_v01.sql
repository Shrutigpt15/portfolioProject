
-- CREATING TABLES IN OUR DATABASE

--Table 1- Publisher details
CREATE TABLE publisher(
    publisher_name VARCHAR(100) PRIMARY KEY NOT NULL,
    publisher_address VARCHAR(200),
    publisher_phone VARCHAR(50) 
)

--Table 2- Book details
CREATE TABLE book(
    book_ID INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	book_title VARCHAR(100) NOT NULL,
	bookpublisher_Name VARCHAR(100) 
	 CONSTRAINT fk_publisher_name1 FOREIGN KEY --gives a name to the foreign key constraint
	 REFERENCES publisher(publisher_name) ON UPDATE CASCADE ON DELETE SET NULL,
	 )
SELECT * FROM book

--Table-3- Library branch

CREATE TABLE library_branch (
		branch_ID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		branch_name VARCHAR(100) NOT NULL,
		branch_address VARCHAR(200) DEFAULT 'not given',
	)
SELECT * FROM library_branch


--Table-4-Borrower details
CREATE TABLE borrower (
		CardNo INT PRIMARY KEY NOT NULL IDENTITY (100,1),
		borrower_name VARCHAR(100) NOT NULL,
		borrower_address VARCHAR(200) DEFAULT 'not given',
		borrower_phone VARCHAR(50) DEFAULT 'not given',
	)

SELECT * FROM borrower

--Table-5- Book loaned

CREATE TABLE book_loans (
		loans_ID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		book_ID INT NOT NULL CONSTRAINT fk_book_id1 FOREIGN KEY REFERENCES book(book_ID) ON UPDATE CASCADE ON DELETE CASCADE,
		Branch_ID INT NOT NULL CONSTRAINT fk_branch_id1 FOREIGN KEY REFERENCES library_branch(branch_ID) ON UPDATE CASCADE ON DELETE CASCADE,
		Card_No INT NOT NULL CONSTRAINT fk_cardno FOREIGN KEY REFERENCES borrower(CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
		date_out VARCHAR(50) NOT NULL,
		due_date VARCHAR(50) NOT NULL,
	)
SELECT* FROM book_loans

--Table-6- Book Copies
CREATE TABLE book_copies (
	   CopiesID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	   BookID INT NOT NULL CONSTRAINT fk_book_id2 FOREIGN KEY REFERENCES book(book_ID) ON UPDATE CASCADE ON DELETE CASCADE,
	   BranchID INT NOT NULL CONSTRAINT fk_branch_id2 FOREIGN KEY REFERENCES library_branch(branch_ID) ON UPDATE CASCADE ON DELETE CASCADE,
	   No_Of_Copies INT NOT NULL,
	)

	--SELECT * FROM book_copies

--Table-7- Book authors
CREATE TABLE book_authors (
		author_ID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		book_ID INT NOT NULL CONSTRAINT fk_book_id3 FOREIGN KEY REFERENCES book(book_ID) ON UPDATE CASCADE ON DELETE CASCADE,
		author_name VARCHAR(50) NOT NULL,
	)

-------- INSERTING VALUES IN THE TABLES---------


INSERT INTO publisher
		VALUES
		('DAW Books','375 Hudson Street, New York, NY 10014','212-366-2000'),
		('Viking','375 Hudson Street, New York, NY 10014','212-366-2000'),
		('Signet Books','375 Hudson Street, New York, NY 10014','212-366-2000'),
		('Chilton Books','Not Available','Not Available'),
		('George Allen & Unwin','83 Alexander Ln, Crows Nest NSW 2065, Australia','+61-2-8425-0100'),
		('Alfred A. Knopf','The Knopf Doubleday Group Domestic Rights, 1745 Broadway, New York, NY 10019','212-940-7390'),		
		('Bloomsbury','Bloomsbury Publishing Inc., 1385 Broadway, 5th Floor, New York, NY 10018','212-419-5300'),
		('Shinchosa','Oga Bldg. 8, 2-5-4 Sarugaku-cho, Chiyoda-ku, Tokyo 101-0064 Japan','+81-3-5577-6507'),
		('Harper and Row','HarperCollins Publishers, 195 Broadway, New York, NY 10007','212-207-7000'),
		('Pan Books','175 Fifth Avenue, New York, NY 10010','646-307-5745'),
		('Chalto & Windus','375 Hudson Street, New York, NY 10014','212-366-2000'),
		('Harcourt Brace Jovanovich','3 Park Ave, New York, NY 10016','212-420-5800'),
		('W.W. Norton',' W. W. Norton & Company, Inc., 500 Fifth Avenue, New York, New York 10110','212-354-5500'),
		('Scholastic','557 Broadway, New York, NY 10012','800-724-6527'),
		('Bantam','375 Hudson Street, New York, NY 10014','212-366-2000'),
		('Picador USA','175 Fifth Avenue, New York, NY 10010','646-307-5745')	

SELECT* FROM publisher

INSERT INTO book
		(book_Title, bookpublisher_Name)
		VALUES 
		('The Name of the Wind', 'DAW Books'),
		('It', 'Viking'),
		('The Green Mile', 'Signet Books'),
		('Dune', 'Chilton Books'),
		('The Hobbit', 'George Allen & Unwin'),
		('Eragon', 'Alfred A. Knopf'),
		('A Wise Mans Fear', 'DAW Books'),
		('Harry Potter and the Philosophers Stone', 'Bloomsbury'),
		('Hard Boiled Wonderland and The End of the World', 'Shinchosa'),
		('The Giving Tree', 'Harper and Row'),
		('The Hitchhikers Guide to the Galaxy', 'Pan Books'),
		('Brave New World', 'Chalto & Windus'),
		('The Princess Bride', 'Harcourt Brace Jovanovich'),
		('Fight Club', 'W.W. Norton'),
		('Holes', 'Scholastic'),
		('Harry Potter and the Chamber of Secrets', 'Bloomsbury'),
		('Harry Potter and the Prisoner of Azkaban', 'Bloomsbury'),
		('The Fellowship of the Ring', 'George Allen & Unwin'),
		('A Game of Thrones', 'Bantam'),
		('The Lost Tribe', 'Picador USA')

SELECT *FROM book

INSERT INTO library_branch
		(branch_name, branch_address)
		VALUES
		('Sharpstown','32 Corner Road, New York, NY 10012'),
		('Central','491 3rd Street, New York, NY 10014'),
		('Saline','40 State Street, Saline, MI 48176'),
		('Ann Arbor','101 South University, Ann Arbor, MI 48104')

SELECT* FROM library_branch

INSERT INTO borrower
		(borrower_name,borrower_address, borrower_phone)
		VALUES
		('Joe Smith','1321 4th Street, New York, NY 10014','212-312-1234'),
		('Jane Smith','1321 4th Street, New York, NY 10014','212-931-4124'),
		('Tom Li','981 Main Street, Ann Arbor, MI 48104','734-902-7455'),
		('Angela Thompson','2212 Green Avenue, Ann Arbor, MI 48104','313-591-2122'),
		('Harry Emnace','121 Park Drive, Ann Arbor, MI 48104','412-512-5522'),
		('Tom Haverford','23 75th Street, New York, NY 10014','212-631-3418'),
		('Haley Jackson','231 52nd Avenue New York, NY 10014','212-419-9935'),
		('Michael Horford','653 Glen Avenue, Ann Arbor, MI 48104','734-998-1513');


INSERT INTO book_loans
		(book_ID, Branch_ID, Card_No, date_out, due_date)
		VALUES
		('1','1','100','1/1/18','2/2/18'),
		('2','1','100','1/1/18','2/2/18'),
		('3','1','100','1/1/18','2/2/18'),
		('4','1','100','1/1/18','2/2/18'),
		('5','1','102','1/3/18','2/3/18'),
		('6','1','102','1/3/18','2/3/18'),
		('7','1','102','1/3/18','2/3/18'),
		('8','1','102','1/3/18','2/3/18'),
		('9','1','102','1/3/18','2/3/18'),
		('11','1','102','1/3/18','2/3/18'),
		('12','2','105','12/12/17','1/12/18'),
		('10','2','105','12/12/17','1/12/17'),
		('20','2','105','2/3/18','3/3/18'),
		('18','2','105','1/5/18','2/5/18'),
		('19','2','105','1/5/18','2/5/18'),
		('19','2','100','1/3/18','2/3/18'),
		('11','2','106','1/7/18','2/7/18'),
		('1','2','106','1/7/18','2/7/18'),
		('2','2','100','1/7/18','2/7/18'),
		('3','2','100','1/7/18','2/7/18'),
		('5','2','105','12/12/17','1/12/18'),
		('4','3','103','1/9/18','2/9/18'),
		('7','3','102','1/3/18','2/3/18'),
		('17','3','102','1/3/18','2/3/18'),
		('16','3','104','1/3/18','2/3/18'),
		('15','3','104','1/3/18','2/3/18'),
		('15','3','107','1/3/18','2/3/18'),
		('14','3','104','1/3/18','2/3/18'),
		('13','3','107','1/3/18','2/3/18'),
		('13','3','102','1/3/18','2/3/18'),
		('19','3','102','12/12/17','1/12/18'),
		('20','4','103','1/3/18','2/3/18'),
		('1','4','102','1/12/18','2/12/18'),
		('3','4','107','1/3/18','2/3/18'),
		('18','4','107','1/3/18','2/3/18'),
		('12','4','102','1/4/18','2/4/18'),
		('11','4','103','1/15/18','2/15/18'),
		('9','4','103','1/15/18','2/15/18'),
		('7','4','107','1/1/18','2/2/18'),
		('4','4','103','1/1/18','2/2/18'),
		('1','4','103','2/2/17','3/2/18'),
		('20','4','103','1/3/18','2/3/18'),
		('1','4','102','1/12/18','2/12/18'),
		('3','4','107','1/13/18','2/13/18'),
		('18','4','107','1/13/18','2/13/18'),
		('12','4','102','1/14/18','2/14/18'),
		('11','4','103','1/15/18','2/15/18'),
		('9','4','103','1/15/18','2/15/18'),
		('7','4','107','1/19/18','2/19/18'),
		('4','4','103','1/19/18','2/19/18'),
		('1','4','103','1/22/18','2/22/18')	


INSERT INTO book_copies
		(BookID, BranchID, No_Of_Copies)
		VALUES
		('1','1','5'),
		('2','1','5'),
		('3','1','5'),
		('4','1','5'),
		('5','1','5'),
		('6','1','5'),
		('7','1','5'),
		('8','1','5'),
		('9','1','5'),
		('10','1','5'),
		('11','1','5'),
		('12','1','5'),
		('13','1','5'),
		('14','1','5'),
		('15','1','5'),
		('16','1','5'),
		('17','1','5'),
		('18','1','5'),
		('19','1','5'),
		('20','1','5'),
		('1','2','5'),
		('2','2','5'),
		('3','2','5'),
		('4','2','5'),
		('5','2','5'),
		('6','2','5'),
		('7','2','5'),
		('8','2','5'),
		('9','2','5'),
		('10','2','5'),
		('11','2','5'),
		('12','2','5'),
		('13','2','5'),
		('14','2','5'),
		('15','2','5'),
		('16','2','5'),
		('17','2','5'),
		('18','2','5'),
		('19','2','5'),
		('20','2','5'),
		('1','3','5'),
		('2','3','5'),
		('3','3','5'),
		('4','3','5'),
		('5','3','5'),
		('6','3','5'),
		('7','3','5'),
		('8','3','5'),
		('9','3','5'),
		('10','3','5'),
		('11','3','5'),
		('12','3','5'),
		('13','3','5'),
		('14','3','5'),
		('15','3','5'),
		('16','3','5'),
		('17','3','5'),
		('18','3','5'),
		('19','3','5'),
		('20','3','5'),
		('1','4','5'),
		('2','4','5'),
		('3','4','5'),
		('4','4','5'),
		('5','4','5'),
		('6','4','5'),
		('7','4','5'),
		('8','4','5'),
		('9','4','5'),
		('10','4','5'),
		('11','4','5'),
		('12','4','5'),
		('13','4','5'),
		('14','4','5'),
		('15','4','5'),
		('16','4','5'),
		('17','4','5'),
		('18','4','5'),
		('19','4','5'),
		('20','4','5');
SELECT* FROM book_copies

INSERT INTO book_authors
		(book_ID,author_name)
		VALUES
		('1','Patrick Rothfuss'),
		('2','Stephen King'),
		('3','Stephen King'),
		('4','Frank Herbert'),
		('5','J.R.R. Tolkien'),
		('6','Christopher Paolini'),
		('6','Patrick Rothfuss'),
		('8','J.K. Rowling'),
		('9','Haruki Murakami'),
		('10','Shel Silverstein'),
		('11','Douglas Adams'),
		('12','Aldous Huxley'),
		('13','William Goldman'),
		('14','Chuck Palahniuk'),
		('15','Louis Sachar'),
		('16','J.K. Rowling'),
		('17','J.K. Rowling'),
		('18','J.R.R. Tolkien'),
		('19','George R.R. Martin'),
		('20','Mark Lee')

SELECT* FROM book_authors

------------ END OF POPULATING TABLES------------------------------------------------

---QUERY QUESTIONS---------------------------------------------

-- Q1- How many copies of the book titled 'The lost tribe' are owned by the library branch whose name is "Sharpstown"?

-- Answer
--METHOD 1) Using Primary and Foreign Keys--------------------------------------------
-- reviewing the data in the table library_branch

SELECT * FROM library_branch

--useful info-branch_id of Sharpstown is 1
--Retrieving the book_id of 'The Lost Tribe'

SELECT book_id FROM book
WHERE book_title='The Lost Tribe'

SELECT * FROM book_copies
WHERE  BranchID=1 AND BookID=20

--METHOD 2) using JOIN--------------------------------------------
SELECT book.book_ID,book.book_title,branch.branch_name,copies.No_Of_Copies
FROM book_copies AS copies
JOIN book
ON copies.BookID=book.book_ID 
JOIN library_branch as branch
ON copies.BranchID=branch.branch_ID
WHERE branch.branch_name ='Sharpstown' AND book.book_title='The Lost Tribe'

-- Q2-How many copies of the book titled "The Lost Tribe" are owned by each library branch? 
--Method 1
SELECT book.book_ID,book.book_title,branch.branch_name,copies.No_Of_Copies
FROM book_copies AS copies
JOIN book
     ON copies.BookID=book.book_ID 
JOIN library_branch as branch
     ON copies.BranchID=branch.branch_ID
     WHERE book.book_title='The Lost Tribe'
--Method 2
--Here we will create a stored procedure so that we can use it to extract data about all different kinds of books
-----------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE bookCopiesAtAllBranches @book_title varchar(70)
AS
   SELECT book.book_ID,book.book_title,branch.branch_name,copies.No_Of_Copies
   FROM book_copies AS copies
   JOIN book
      ON copies.BookID=book.book_ID 
   JOIN library_branch as branch
       ON copies.BranchID=branch.branch_ID
   WHERE book.book_title=@book_title
GO
-- Testing our Stored procedure on 'Harry Potter and the Chamber of Secrets'----------------------------------------------------
EXEC dbo.bookCopiesAtAllBranches @book_title='Harry Potter and the Chamber of Secrets'

--Before going any further, I noticed that the dates used in the table book_loans are in the mm//dd/yy format so we change into standard SQL format of yyyy-mm-dd so it is more understandable to everyone.

--SELECT CONVERT(date,date_out),date_out
--FROM book_loans

UPDATE book_loans
SET date_out=CONVERT(date,date_out)
SELECT * FROM book_loans
UPDATE book_loans
SET due_date=CONVERT(date,due_date)

--Changes were made successfully-----------------------------------------------//

--Q3-Retrieve the names of all borrowers who do not have any books checked out.
-- used a sub query for results.
SELECT borrower.borrower_name
FROM borrower
WHERE borrower.CardNo NOT IN(
      SELECT DISTINCT(Card_No)
      FROM book_loans)

-- Q4-For each library branch, retrieve the branch name and the total number of books loaned out from that branch. 

SELECT Branch.branch_name,COUNT(Loans.loans_ID) as books_loaned
FROM book_loans AS Loans
	INNER JOIN library_branch AS Branch
			ON Loans.Branch_ID = Branch.branch_ID
			GROUP BY Branch.branch_name 
		
 --Q6- Retrieve the names, addresses, and number of books checked out for all borrowers who have more than five books checked out.
 
WITH borrower_bookCount AS
(SELECT borrower.borrower_name,borrower.borrower_address,COUNT(loans.loans_ID) as total_books_loaned
   FROM book_loans as loans
   JOIN borrower
       ON loans.Card_No=borrower.CardNo
	   GROUP BY borrower.borrower_name,borrower.borrower_address
)
SELECT * 
FROM borrower_bookCount
WHERE total_books_loaned>5

--Q6)For each book authored by "Stephen King", retrieve the title and the number of copies owned by the library branch whose name is "Central"

SELECT book.book_title,copies.No_Of_Copies 
FROM book_copies as copies
   JOIN book_authors as authors
        ON copies.BookID= authors.book_ID
   JOIN library_branch as branch
        ON copies.BranchID=branch.branch_ID
   JOIN book
        ON copies.BookID=book.book_ID
		WHERE authors.author_name='Stephen King' and branch.branch_name='Central'
