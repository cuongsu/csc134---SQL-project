CREATE TABLE Customer (
ssn CHAR(9) NOT NULL,
fname CHAR(25) NOT NULL,
lname VARCHAR(25) NOT NULL,
phone VARCHAR(10) NOT NULL,
address VARCHAR(50),
PRIMARY KEY(ssn)
);

CREATE TABLE Account (
acc_no CHAR(9) NOT NULL,
balance DECIMAL(15,2) NOT NULL,
open_date DATE,
atype VARCHAR(10),
PRIMARY KEY(acc_no)
);

CREATE TABLE Owns (
ssn CHAR(9) NOT NULL,
acc_no CHAR(9) NOT NULL,
own_date DATE,
PRIMARY KEY(ssn, acc_no),
FOREIGN KEY(ssn) REFERENCES Customer(ssn),
FOREIGN KEY(acc_no) REFERENCES Account(acc_no)
);

CREATE TABLE Loan (
loan_no CHAR(9) NOT NULL,
amount DECIMAL(15,2) NOT NULL,
ltype VARCHAR(10),
PRIMARY KEY(loan_no)
);

CREATE TABLE Payment (
loan_no CHAR(9) NOT NULL,
payment_no CHAR(4) NOT NULL,
payment_amount DECIMAL(15,2) NOT NULL,
method VARCHAR(10) NOT NULL,
status VARCHAR(10) NOT NULL,
due_date DATE,
PRIMARY KEY(loan_no, payment_no),
FOREIGN KEY(loan_no) REFERENCES Loan(loan_no)
);

CREATE TABLE Borrows (
ssn CHAR(9) NOT NULL,
loan_no CHAR(9) NOT NULL,
PRIMARY KEY(ssn, loan_no),
FOREIGN KEY(ssn) REFERENCES Customer(ssn),
FOREIGN KEY(loan_no) REFERENCES Loan(loan_no)
);