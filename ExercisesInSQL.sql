USE Company;
-- 1.Επιλογή Πεδίων απο πίνακα - Συγκρίσεις
-- ***  1. Να βρεθεί το επώνυμο και το όνομα όλων των υπαλλήλων
SELECT firstname, lastname FROM employees;

-- ***  2. Να βρεθεί το επώνυμο όλων των υπαλλήλων
SELECT lastname FROM employees;

-- ***  3. Μετονομασία Επικεφαλίδας (ένα κελί) στο αποτέλεσμα
SELECT lastname AS Eponimo FROM employees;

-- ***  4. Μετονομασία Επικεφαλίδων (πάνω απο ένα κελί) στο αποτέλεσμα
SELECT firstname AS onoma,lastname AS eponimo,salary AS misthos FROM employees;

-- ***  5. Να βρεθεί το επώνυμο και το όνομα των υπαλλήλων με μισθό μεγαλύτερο απο 1500 euro
SELECT lastname, firstname, salary FROM employees WHERE salary >1500;

-- ***  6. Να βρεθούν όλα τα στοιχεία των υπαλλήλων με το όνομα Μιχάλης
SELECT firstname, lastname FROM employees WHERE firstname = 'Michalis';

-- ***  7. Να βρεθούν όλα τα στοιχεία των υπαλλήλων μετά το Μπέζου
SELECT firstname, lastname FROM employees WHERE lastname > 'Mbezou';

-- ***  8. Να βρεθούν το επώνυμο ,το όνομα και ο μισθός των υπαλλήλων που εργάζονται στο τμήμα 1 (Human Resources)
SELECT lastname, firstname, salary,depid FROM employees WHERE depid =1;

-- ***  9. Να βρεθούν το επώνυμο ,το όνομα,το τμήμα  και ο μισθός των υπαλλήλων που δεν εργάζονται στο τμήμα 1 (Human Resources)
SELECT lastname, firstname, salary,depid FROM employees WHERE depid !=1;

-- ***  10. Να βρεθούν ο τίτλος και ο προυπολογισμός του έργου με κωδικό 64874
SELECT title, budget FROM projects WHERE id=64874;

-- ***  11. Να βρεθούν το όνομα , ο μισθός και το τμήμα των υπαλλήλων που παίρνουν μισθό πάνω απο 1300 euro
SELECT firstname, salary, depid FROM employees WHERE salary>1300;

-- ***  12. Να βρεθούν το όνομα , ο μισθός και το τμήμα των υπαλλήλων που παίρνουν μισθό μεγαλύτερο ή ίσο με  1300 euro
SELECT firstname,salary,depid FROM employees WHERE salary>=1300;

-- ***  13. Να βρεθούν το όνομα , ο μισθός , η ημερομήνία πρόσληψης  και το τμήμα των υπαλλήλων που προσλήφθηκαν μετα την 2012-04-15
SELECT firstname, salary, hiredate, depid FROM employees WHERE hiredate>'2012-04-15';

-- ***  14. Να βρεθούν το όνομα , ο μισθός , η ημερομήνία πρόσληψης  και το τμήμα των υπαλλήλων που προσλήφθηκαν πρίν την 2012-04-15
SELECT firstname, salary, hiredate, depid FROM employees WHERE hiredate < '2012-04-05';

-- ***  15. Να βρεθούν το όνομα και  ο μισθός της υπαλλήλου με επώνυμο Στράτου
SELECT firstname, lastname, salary FROM employees WHERE lastname ='Stratou';

-- ***  16. Να βρεθούν όλες οι λεπτομέρειες των υπαλλήλων που το όνομα τους ειναι Στράτου και μετά
SELECT * FROM employees WHERE lastname >= 'Stratou';

-- ***  17. Να βρεθεί ο τίτλος και ο προυπολογισμός των έργων με βαθμό προόδου μεγαλύτερο του 50%
SELECT title, budget,progress FROM projects WHERE progress > 50 ORDER BY progress DESC;

-- ***  18. Να βρεθεί ο τίτλος, η ημερομηνία έναρξης και η ημερομηνία λήξης και το budget  των έργων με ημερομηνία έναρξης απο και μετά την 2018-04-25
SELECT title, startdate, enddate, budget FROM projects WHERE startdate >= '2018-04-25';

-- ***  19. Να βρεθεί ο κωδικός των υπαλλήλων που εργάζονται στο έργο 67545
SELECT empid, proid FROM workson WHERE proid=67545;

-- ***  20. Να βρεθεί ο κωδικός των έργων που εργάζεται ο υπάλληλος με κωδικό 912
SELECT proid, empid FROM workson WHERE empid=912;

-- 2.Πράξεις με πεδία
-- ***  1. Να βρεθεί το όνομα το επώνυμο το τμήμα που εργάζεται ο υπάλληλος και ο νέος Μισθός μετά απο αύξηση 150 ευρώ στο Μισθολόγιο του τμήματος 2 Sales
SELECT firstname, lastname, depid, salary, (salary+150) FROM employees WHERE depid=2;

-- ***  2. Να βρεθεί το όνομα το επώνυμο το τμήμα που εργάζεται ο υπάλληλος  και ο νέος Μισθός μετά απο αύξηση 150 ευρώ στο Μισθολόγιο του τμήματος 2 Sales (New Salary στο όνομα του πεδίου του αποτελέσματος)
SELECT firstname, lastname, depid, salary, (salary+150) AS 'New Salary' FROM employees WHERE depid=2;

-- ***  3. Να βρεθoύν όλα τα στοιχεία  μετά απο αύξηση 150 ευρώ στο Μισθολόγιο του τμήματος 2 Sales και μόνο για όσους είναι πάνω απο 1600 euro (New Salary στο όνομα του πεδίου του αποτελέσματος)
SELECT *, (salary+150) AS 'New Salary' FROM employees WHERE depid=2 AND salary+150>1600;

-- ***  4. Να βρεθεί ο κωδικός το όνομα και το επώνυμο και ο Μίσθος του Υπαλλήλου με κωδικό 836 μετά απο αύξηση 5% (New Salary στο όνομα του πεδίου του αποτελέσματος)
SELECT id, firstname, lastname, salary, salary*1.05 AS 'New Salary' FROM employees WHERE id=836;

-- ***  5. Να βρεθούν όλες οι λεπτομέρειες των υπαλλήλων που ο μισθός τους θα ανέβει περισσότερο απο 100 ευρώ αν πάρουν αύξηση 4%
SELECT * FROM employees WHERE salary*0.04>100; 

-- ***  6. Να βρεθούν το id το όνομα και το επώνυμο τών υπαλλήλων και ο νέος Μισθός, που αν πάρουν αύξηση 5% θα είναι ο νέος μισθός πάνω απο 2000 ευρώ
SELECT id, firstname, lastname, salary*1.05 AS 'New Salary' FROM employees WHERE salary*1.05>2000;

-- 3.Ταξινόμηση Δεδομένων
-- ***  1. Να βρεθούν το όνομα και ο μισθός όλων των υπαλλήλων με αύξουσα ταξινόμηση ως προς το μισθό
SELECT firstname, salary FROM employees ORDER BY salary;

-- ***  2. Να βρεθούν το όνομα το επώνυμο και το τμήμα των υπαλλήλων με αύξουσα ταξινόμηση ως προς το τμήμα 
SELECT lastname, depid FROM employees ORDER BY depid;

-- ***  3. Να βρεθούν id, το όνομα το επώνυμο και ο μισθός των υπαλλήλων που παίρνουν μισθό μεγαλύτερο ή ίσο με 1500 ευρώ με αύξουσα ταξινόμηση ως πρός το μισθό
SELECT id, firstname, lastname, salary FROM employees WHERE salary>=1500 ORDER BY salary;

-- ***  4. Να βρεθούν id, το όνομα το επώνυμο και η ημερομηνία πρόσληψης των υπαλλήλων που προσλήφθηκαν μετα την 2012-05-21 με φθίνουσα ταξινόμηση ως προς την ημερομηνία πρόσληψης.
SELECT id, firstname, lastname, hiredate FROM employees WHERE hiredate > 2012-05-21 ORDER BY hiredate DESC;

-- ***  5. Να βρεθούν το όνομα και ο μισθός όλων των υπαλλήλων με αύξουσα ταξινόμηση ως προς το μισθό και το όνομα
SELECT firstname, salary FROM employees ORDER BY salary,firstname;

-- 4.Απαλοιφή Διπλοεγγραφών
-- ***  1. Να βρεθούν τα id των τμήματων των εργαζομένων
SELECT DISTINCT depid FROM employees;

-- ***  2. Να βρεθούν τα id των τμήματων και ο μισθός των υπαλλήλων
SELECT DISTINCT depid,salary FROM employees;

-- ***  3. Να βρεθούν τα μικρά ονόματα των Υπαλλήλων
SELECT DISTINCT firstname FROM employees;

-- ***  4. Να βρεθούν οι μισθοί των Υπαλλήλων
SELECT DISTINCT salary FROM employees;

-- ***  5. Να βρεθούν τα τμήματα των υπαλλήλων στα οποία ο μισθός θα ανέβει αν πάρουν αύξηση 3,5% 
--?

-- 5.Χειρισμός Αγνώστων τιμών
-- ***  1. Να βρεθούν όλα τα στοιχεία των υπαλλήλων  που  ανήκουν σε κανένα τμήμα 
SELECT *FROM employees WHERE depid !=ALL(SELECT depid FROM employees);
--or
SELECT *FROM employees WHERE NOT EXISTS (SELECT depid FROM workson WHERE depid IN (1,2,3,4,5,6));

-- ***  2. Να βρεθούν όλα τα στοιχεία των υπαλλήλων  που δεν ανήκουν  σε κανένα τμήμα 
SELECT *FROM employees WHERE depid NOT IN (1,2,3,4,5,6);

-- ***  3. Να βρεθούν τα τμήματα στα οποία εργάζονται υπάλληλοι και δεν τους έχει καταχωρηθεί μισθός
SELECT depid FROM employees WHERE salary IS NULL;

-- 6.Ταίριασμα Κειμένου
-- ***  1. Να βρεθούν οι υπάλληλοι με το μικρό όνομα Μιχάλης
SELECT firstname FROM employees WHERE firstname='Michalis';

-- ***  2. Να βρεθούν οι υπάλληλοι που το μικρό όνομα αρχίζει με Μ
SELECT firstname FROM employees WHERE firstname LIKE 'M%';

-- ***  3. Να βρεθούν οι υπάλληλοι που το μικρό όνομα τελειώνει σε ς 
SELECT firstname FROM employees WHERE firstname LIKE '%s';

-- ***  4. Να βρεθούν οι υπάλληλοι που το μικρό όνομα να αρχίζει με Σ και να  τελειώνει σε ς 
SELECT firstname FROM employees WHERE firstname LIKE 'S%s';

-- ***  5. Να βρεθούν οι υπάλληλοι που το μικρό όνομα έχει δευτερο χαρακτήρα το α και τελειώνει με ς
SELECT firstname FROM employees WHERE firstname LIKE '_a%s';

-- ***  6. Να βρεθούν οι υπάλληλοι που το μικρό όνομα έχει δευτερο χαρακτήρα το α 
SELECT firstname FROM employees WHERE firstname LIKE '_a%';

-- ***  7. Να βρεθούν οι υπάλληλοι που το μικρό όνομα περιεχει τα γράμματα 'an' 
SELECT firstname FROM employees WHERE firstname LIKE '%an%';

-- 7. Λογικοί Τελεστές
-- ***  1. Να βρεθούν τα ονόματα και τα επώνυμα των υπαλλήλων που εργάζονται στο  τμήμα 1 και στο τμήμα 3 
SELECT firstname, lastname,depid FROM employees WHERE depid=1 OR depid=3;

-- ***  2. Να βρεθούν τα ονόματα και τα επώνυμα των υπαλλήλων που εργάζονται στο  τμήμα 2 και έχουν μισθό μεγαλυτερο απο 1500 
SELECT firstname, lastname FROM employees WHERE depid=2 AND salary> 1500;

-- ***  3. Να βρεθούν τα ονόματα και τα επώνυμα των υπαλλήλων που εργάζονται στο  τμήμα 2 και έχουν μισθό απο 1200 εως 1500 (1200-1500)
SELECT firstname, lastname, salary FROM employees WHERE depid=2 AND salary BETWEEN 1200 AND 1500; 

-- ***  4. Να βρεθούν οι υπάλληλοι (κωδικός ,όνομα ,τμήμα) που εργάζονται στο τμημα 1 ή παιρνουν μισθό μεγαλύτερο απο 1500 ευρώ
SELECT id, firstname, depid, salary FROM employees WHERE depid=1 OR salary>1500;

-- ***  5. Να βρεθούν οι υπάλληλοι (κωδικός ,όνομα ,τμήμα) που εργάζονται στο τμημα 2 ή παιρνουν μισθό μικρότερο απο 1300 ευρώ
SELECT id, firstname, depid, salary FROM employees WHERE depid=2 OR salary<1300;

-- 8.Τελεστές Συνόλου
-- ***  1. Να βρεθούν ολές οι λεπτομέρειες των υπαλλήλων πυ εργάζονται στα τμήματα 2,3,4
SELECT * FROM employees WHERE depid IN(2,3,4);

-- ***  2. Να βρεθούν ολές οι λεπτομέρειες των υπαλλήλων που δεν  εργάζονται στα τμήματα 2,3,4
SELECT *FROM employees WHERE depid NOT IN(2,3,4);

-- ***  3. Να βρεθούν ολές οι λεπτομέρειες των υπαλλήλων που παίρνουν Μισθό 1200 ή 1300 ή 2000 ευρώ
SELECT *FROM employees WHERE salary=1200 OR salary=1300 OR salary=2000;

-- 9.Τελεστής Περιοχών Τιμών
-- ***  1. Να βρεθούν ολές οι λεπτομέρειες των υπαλλήλων που παίρνουν Μισθό μεταξύ 1000 και 1500 ευρω
SELECT * FROM employees WHERE salary BETWEEN 1000 AND 1500;

-- ***  2. Να βρεθούν ολές οι λεπτομέρειες των υπαλλήλων που παίρνουν Μισθό οχι απο  1000 ως 1500 ευρω
SELECT *FROM employees WHERE salary NOT BETWEEN 1000 AND 1500;

-- ***  3. Να βρεθούν ολές οι λεπτομέρειες των υπαλλήλων που ανήκουν στα τμήματα απο 1 εως και 3 
SELECT * FROM employees WHERE depid BETWEEN 1 AND 3;

-- 10.Συναρτήσεις Συνάθροισης
-- A.Υπολογίζω Άθροισμα
-- ***  1. Να βρεθεί το άθροισμα των μισθών όλων των υπαλλήλων
SELECT SUM(salary) FROM employees;

-- ***  2. Να βρεθεί το άθροισμα των μισθών όλων των υπαλλήλων του τμήματος 4 
SELECT SUM(salary) FROM employees WHERE depid>4;

-- ***  3. Να βρεθεί το επιπλέον ποσό αν οι υπάλληλοι του τμήματος 2 πάρουν απο 3% αύξηση
SELECT SUM(salary*0.03) FROM employees WHERE depid=2;

-- B.Υπολογίζω Μέσο όρο
-- ***  1. Να βρεθεί ο μέσος όρος των μισθών όλων των υπαλλήλων
SELECT AVG(salary) FROM employees;

-- ***  2. Να βρεθεί ο μέσος όρος των μισθών όλων των υπαλλήλων του τμήματος 3
SELECT AVG(salary) FROM employees WHERE depid=3;

-- C.Υπολογίζοντας τη Μικρότερη και τη Μεγαλύτερη Τιμή
-- ***  1. Να βρεθεί ο μικρότερος μισθός όλων των υπαλλήλων του τμήματος 3
SELECT MIN(salary) FROM employees WHERE depid=3;

-- ***  2. Να βρεθεί η ημερομηνία της πιό πρόσφατης πρόσληψης.
SELECT MAX(hiredate) FROM employees;

-- ***  3. Να βρεθεί η διαφορά Μεγαλύτερου Μικρότερου Μισθού όλων των υπαλλήλων
SELECT MAX(salary) - MIN(salary) FROM employees;

-- D.Καταμέτρηση Πλήθους
-- ***  1. Να βρεθεί πόσοι Υπάλληλοι παίρνουν μισθό μικρότερο απο 1500
SELECT COUNT(*) FROM employees WHERE salary<1500;

-- ***  2. Να βρεθεί ο μέσος όρος των μισθών όλων των υπαλλήλων
SELECT SUM(salary)/COUNT(*) FROM employees;

-- E.Ομαδοποίηση και Συναρτήσεις Συνάθροισης
-- ***  1. Να βρεθεί ο κωδικος του τμηματος και το συνολο των υπαλληλων του καθε τμηματος (σε πινακα )
SELECT depid, COUNT(*) FROM employees GROUP BY depid;

-- ***  2. Να βρεθεί ο ελάχιστος μισθός ανα τμήμα
SELECT depid, MIN(Salary) FROM employees GROUP BY depid;

-- ***  3. Να βρεθεί το πλήθος των υπαλλήλων ανα μικρό όνομα
SELECT firstname, COUNT(firstname) FROM employees GROUP BY firstname;

-- ***  4. Να βρεθεί το άθροισμα των μισθών των υπαλλήλων ανα τμήμα
SELECT depid, SUM(salary) FROM employees GROUP BY depid;

-- ***  5. Να βρεθεί το άθροισμα των μισθών των υπαλλήλων ανα τμήμα για τους υπαλλήλους που προσλήφθηκαν μεταξύ 2004-01-01 και του 2009-10-25
SELECT depid, SUM(salary) FROM employees WHERE hiredate BETWEEN '2004-01-01' AND '2009-10-25' GROUP BY depid ;

-- ***  6. Να βρεθεί η διαφορά μεγαλύτερου μικρότερου μισθού ανα τμήμα
SELECT depid, MAX(salary)-MIN(salary) FROM employees GROUP BY depid;

-- ***  7. Να βρεθεί η ποσοστιαία διαφορά μεγαλύτερου - μέσου μισθού  υπαλλήλου ως προς το μέσο μισθό ανα τμήμα με φθίνουσα ταξινόμηση ως προς την ποσοστιαία διαφορά
SELECT depid, (MAX(salary)-AVG(salary))*100/AVG(salary) FROM employees GROUP BY depid ORDER BY (MAX(salary)-AVG(salary))*100/AVG(salary) DESC; 

-- ***  8. Να βρεθεί o αριθμός τμημάτος και το σύνολο των εργαζομένων ανα τμήμα  ( και να κρατήσω μόνο τα μεγαλύτερα του 4)
SELECT depid, COUNT(depid) AS 'Number of Employees' FROM employees GROUP BY depid HAVING COUNT(*)>4;

-- ***  9. Να βρεθεί τα τμηματα με περισσοτερους απο 3 υπαλληλους και μισθό μεγαλύτερο του 1200 ευρω 
SELECT depid, MIN(salary) AS 'Minimum Salary', COUNT(*) AS 'Number of Employees' FROM employees GROUP BY depid HAVING COUNT(depid)>3 AND MIN(salary)>1200;

-- ***  10. Να βρεθούν τα τμηματα με περισσοτερους απο 3 υπαλληλους και μέσο μισθό ανα τμήμα μεγαλύτερο του 1200 ευρω 
SELECT depid, COUNT(depid) AS 'Number of Employees',AVG(salary) AS 'Avg Salary' FROM employees GROUP BY depid HAVING COUNT(depid)>3 AND AVG(salary)>1200;

-- ***  11. Να βρεθούν τα μικρά ονόματα των υπαλλήλων που υπάρχουν πάνω απο μία φορές 
SELECT firstname FROM employees GROUP BY firstname HAVING COUNT(firstname)>1;

-- ***  12. Να βρεθει το πλήθος των μικρών ονομάτων ανα όνομα με φθίνουσα ταξινόμηση ως προς το πλήθος 
SELECT firstname, COUNT(firstname) AS 'Firstname Count' FROM employees GROUP BY firstname ORDER BY COUNT(firstname) DESC;

-- 11.Αριθμητικοί Τελεστές
-- ***  1. Πρόσθεση
SELECT 2+2;

-- ***  2. Αφαίρεση
SELECT 2-2;

-- ***  3. Πολλαπλασιασμός
SELECT 2*2;

-- ***  4. Διαίρεση
SELECT 2/2;

-- ***  5. Υπόλοιπο Ακαίρεας διαίρεσης
SELECT 2%2;
