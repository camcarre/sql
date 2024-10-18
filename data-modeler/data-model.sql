-- -- -- Création des tables
CREATE TABLE employees (
    employee_id INTEGER PRIMARY KEY AUTOINCREMENT,
    lastName VARCHAR(255),
    firstName VARCHAR(255),
    departmentId INT,
    title_id INT,
    hire_date DATE,
    email VARCHAR(255),
    phone_number VARCHAR(20),
    salary DECIMAL(10, 2),
    address VARCHAR(255),
    date_of_birth DATE,
    FOREIGN KEY (departmentId) REFERENCES departments(departmentId),
    FOREIGN KEY (title_id) REFERENCES titles(title_id)
);

CREATE TABLE departments (
  departmentId INT PRIMARY KEY,
  department_name VARCHAR(255),
  manager_id INT,
  FOREIGN KEY (manager_id) REFERENCES employees(employee_id)
);

CREATE TABLE titles (
  title_id INT PRIMARY KEY,
  title_name VARCHAR(255)
);

CREATE TABLE attendance (
  attendance_id INT PRIMARY KEY,
  employee_id INT,
  date DATE,
  status VARCHAR(20),
  clock_in_time TIME,
  clock_out_time TIME,
  FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

CREATE TABLE performance_reviews (
  review_id INT PRIMARY KEY,
  employee_id INT,
  review_date DATE,
  reviewer_id INT,
  rating INT CHECK (rating BETWEEN 1 AND 5),
  comments TEXT,
  FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
  FOREIGN KEY (reviewer_id) REFERENCES employees(employee_id)
);

CREATE TABLE benefits (
  benefit_id INT PRIMARY KEY,
  benefit_name VARCHAR(255),
  description TEXT
);

CREATE TABLE employee_benefits (
  employee_id INT,
  benefit_id INT,
  start_date DATE,
  end_date DATE,
  PRIMARY KEY (employee_id, benefit_id),
  FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
  FOREIGN KEY (benefit_id) REFERENCES benefits(benefit_id)
);

-- Insertion des données
INSERT INTO departments (departmentId, department_name, manager_id) VALUES (1, 'Ressources Humaines', NULL);
INSERT INTO departments (departmentId, department_name, manager_id) VALUES (2, 'Informatique', NULL);
INSERT INTO departments (departmentId, department_name, manager_id) VALUES (3, 'Marketing', NULL);
INSERT INTO departments (departmentId, department_name, manager_id) VALUES (4, 'Ventes', NULL);
INSERT INTO departments (departmentId, department_name, manager_id) VALUES (5, 'Finance', NULL);

INSERT INTO titles (title_id, title_name) VALUES (1, 'Manager');
INSERT INTO titles (title_id, title_name) VALUES (2, 'Développeur');
INSERT INTO titles (title_id, title_name) VALUES (3, 'Analyste');

INSERT INTO employees (lastName, firstName, departmentId, title_id, hire_date, email, phone_number, salary, address, date_of_birth) VALUES ('Dupont', 'Marie', 1, 1, '2022-01-15', 'marie.dupont@example.com', '+33 1 23 45 67 89', 45000, '123 Rue de Rivoli, Paris', '1990-04-12');
INSERT INTO employees (lastName, firstName, departmentId, title_id, hire_date, email, phone_number, salary, address, date_of_birth) VALUES ('Moreau', 'Jean', 2, 2, '2021-06-10', 'jean.moreau@example.com', '+33 2 34 56 78 90', 52000, '45 Boulevard Haussmann, Paris', '1985-09-23');
INSERT INTO employees (lastName, firstName, departmentId, title_id, hire_date, email, phone_number, salary, address, date_of_birth) VALUES ('Lefevre', 'Lucie', 3, 3, '2023-03-01', 'lucie.lefevre@example.com', '+33 3 45 67 89 01', 39000, '78 Avenue des Champs-Élysées, Paris', '1993-12-05');
INSERT INTO employees (lastName, firstName, departmentId, title_id, hire_date, email, phone_number, salary, address, date_of_birth) VALUES ('Roux', 'Pierre', 1, 2, '2019-11-18', 'pierre.roux@example.com', '+33 4 56 78 90 12', 58000, '9 Rue de la Paix, Paris', '1982-07-19');
INSERT INTO employees (lastName, firstName, departmentId, title_id, hire_date, email, phone_number, salary, address, date_of_birth) VALUES ('Martineau', 'Sophie', 2, 1, '2020-08-25', 'sophie.martineau@example.com', '+33 5 67 89 01 23', 47000, '56 Rue Saint-Honoré, Paris', '1991-02-28');

INSERT INTO attendance (attendance_id, employee_id, date, status, clock_in_time, clock_out_time) VALUES (1, 1, '2022-01-15', 'Present', '09:00', '17:00');
INSERT INTO attendance (attendance_id, employee_id, date, status, clock_in_time, clock_out_time) VALUES (2, 2, '2021-06-10', 'Present', '09:00', '17:00');
INSERT INTO attendance (attendance_id, employee_id, date, status, clock_in_time, clock_out_time) VALUES (3, 3, '2023-03-01', 'Present', '09:00', '17:00');
INSERT INTO attendance (attendance_id, employee_id, date, status, clock_in_time, clock_out_time) VALUES (4, 4, '2019-11-18', 'Present', '09:00', '17:00');
INSERT INTO attendance (attendance_id, employee_id, date, status, clock_in_time, clock_out_time) VALUES (5, 5, '2020-08-25', 'Present', '09:00', '17:00');

INSERT INTO performance_reviews (review_id, employee_id, review_date, reviewer_id, rating, comments) VALUES (1, 1, '2022-12-15', 2, 4, 'Good performance');
INSERT INTO performance_reviews (review_id, employee_id, review_date, reviewer_id, rating, comments) VALUES (2, 2, '2021-12-10', 1, 5, 'Excellent performance');
INSERT INTO performance_reviews (review_id, employee_id, review_date, reviewer_id, rating, comments) VALUES (3, 3, '2023-06-01', 2, 3, 'Satisfactory performance');
INSERT INTO performance_reviews (review_id, employee_id, review_date, reviewer_id, rating, comments) VALUES (4, 4, '2020-11-18', 3, 4, 'Good performance');
INSERT INTO performance_reviews (review_id, employee_id, review_date, reviewer_id, rating, comments) VALUES (5, 5, '2021-08-25', 1, 5, 'Excellent performance');

INSERT INTO benefits (benefit_id, benefit_name, description) VALUES (1, 'Health Insurance', 'Comprehensive health insurance plan');
INSERT INTO benefits (benefit_id, benefit_name, description) VALUES (2, 'Retirement Plan', 'Company-sponsored retirement plan');
INSERT INTO benefits (benefit_id, benefit_name, description) VALUES (3, 'Paid Time Off', 'Paid vacation and sick leave');

INSERT INTO employee_benefits (employee_id, benefit_id, start_date, end_date) VALUES (1, 1, '2022-01-15', NULL);
INSERT INTO employee_benefits (employee_id, benefit_id, start_date, end_date) VALUES (2, 2, '2021-06-10', NULL);
INSERT INTO employee_benefits (employee_id, benefit_id, start_date, end_date) VALUES (3, 3, '2023-03-01', NULL);
INSERT INTO employee_benefits (employee_id, benefit_id, start_date, end_date) VALUES (4, 1, '2019-11-18', NULL);
INSERT INTO employee_benefits (employee_id, benefit_id, start_date, end_date) VALUES (5, 2, '2020-08-25', NULL);