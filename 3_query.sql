#QUERY 1
SELECT loan_no, payment_no, payment_amount, method
FROM Payment
WHERE status = 'Paid' AND payment_amount < '15.00';

#QUERY 2
SELECT c.ssn, c.fname, c.lname
FROM Customer c, Account a, Owns o
WHERE a.balance > 10000.00 AND c.ssn = o.ssn AND o.acc_no = a.acc_no
GROUP BY c.ssn; 

#QUERY 3
SELECT c.ssn, c.fname, c.lname
FROM Customer c
WHERE (SELECT COUNT(*)
       FROM Account a, Owns o
       WHERE c.ssn = o.ssn AND o.acc_no = a.acc_no) < 3;

#QUERY 4
SELECT c.ssn, c.fname, c.lname, c.phone
FROM Customer c, Account a, Owns o
WHERE a.acc_no = '000000001' AND c.ssn = o.ssn AND o.acc_no = a.acc_no;

#QUERY 5
SELECT p.payment_no, p.due_date
FROM Payment p, Customer c, Borrows b, Loan l
WHERE c.fname = 'John' AND c.lname = 'Smith' AND p.method = 'By Check' 
      AND c.ssn = b.ssn AND l.loan_no = b.loan_no AND l.loan_no = p.loan_no;

#QUERY 6
SELECT c.ssn, c.fname, c.lname
FROM Customer c
WHERE (SELECT COUNT(*)
       FROM Loan l, Borrows b
       WHERE c.ssn = b.ssn AND l.loan_no = b.loan_no) > 0
GROUP BY c.ssn;

#QUERY 7
SELECT c.ssn, COUNT(*)
FROM Customer c, Loan l, Borrows b
WHERE c.ssn = b.ssn AND l.loan_no = b.loan_no AND c.fname = 'John' AND c.lname = 'Smith';

#QUERY 8
SELECT c.ssn, COUNT(*), SUM(a.balance)
FROM Customer c, Account a 
WHERE (SELECT COUNT(*)
       FROM Account a, Owns o
       WHERE c.ssn = o.ssn AND o.acc_no = a.acc_no) > 2;