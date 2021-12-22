USE Company;
-- ***  1. Να βρείτε τους υπαλλήλους που πάιρνουν τον μεγαλύτερο μισθό
SELECT*FROM employees WHERE salary = (SELECT MAX(salary) FROM employees);

-- ***  2. Να βρείτε τους υπαλλήλους που εργάζονται στο ίδιο τμημα με το υπάλληλο 324
SELECT*FROM employees WHERE depid=(SELECT depid FROM employees WHERE id=324);

-- ***  3. Να βρείτε το όνομα των τμημάτων  στα οποια εργάζονται υπάλληλοι οι οποίοι αν πάρουν αυξηση κατα 5%ο μισθός του θα ανένει κατα 100 ευρω
SELECT DISTINCT name FROM departments,employees WHERE departments.id=employees.depid  AND salary*0.05 = 100;

-- ***  4. Να βρεθει το έργο με τη παλαιότερη ημερομηνία έναρξης
SELECT title FROM projects WHERE startdate=(SELECT MIN(startdate) FROM projects);

-- ***  5. Να βρεθούν οι υπάλληλοι που ο μισθός τους είναι μεγαλύτερος απο το μέσο μισθό των υπαλλήλων του τμήματος 4
SELECT firstname, lastname, salary FROM employees WHERE salary>(SELECT AVG(salary) FROM employees WHERE depid=4);

-- ***  6. Να βρεθούν τα ονόματα των υπαλλήλων και το όνομα του τμήματος τους για τους υπαλλήλους που απασχολούνται σε έργο με ποσοστό προόδου μεγαλύτερο του 50% με αύξουσα ταξινόμηση ως προς τον κωδικό τμήματος
SELECT firstname, lastname, [name] AS 'Dep Name' FROM employees,workson,departments,projects WHERE departments.id=employees.depid 
AND employees.id=workson.empid AND projects.id=workson.proid AND progress>50 ORDER BY depid;

-- ***  7. Να βρεθεί το id του τμήματος οπου ο μισθός ειναι μεγαλύτερος απο το μεσο όρο των μισθών πολλαπλασιαμένο με 1.5 απο το τμήμα 5
SELECT DISTINCT depid FROM employees WHERE salary>(SELECT AVG(salary)*1.5 FROM employees WHERE depid=5);

-- ***  8. Να βρεθεί το υποσύνολο των υπαλλήλων που δεν ανήκουν στο id του τμήματος οπου ο μισθός ειναι μεγαλύτερος απο το μεσο όρο των μισθών πολλαπλασιαμένο με 1.5 απο το τμήμα 5
SELECT DISTINCT * FROM employees WHERE NOT (salary > (SELECT AVG(salary)* 1.5 FROM employees WHERE depid = 5));
