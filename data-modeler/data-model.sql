DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS performance_reviews;
DROP TABLE IF EXISTS benefits;
DROP TABLE IF EXISTS employee_benefits;
DROP TABLE IF EXISTS departments;

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
    departmentId INTEGER PRIMARY KEY AUTOINCREMENT,
    department_name VARCHAR(255),
    manager_id INT,
    FOREIGN KEY (manager_id) REFERENCES employees(employee_id)
);

CREATE TABLE titles (
    title_id INTEGER PRIMARY KEY AUTOINCREMENT,
    title_name VARCHAR(255)
);

CREATE TABLE performance_reviews (
    review_id INTEGER PRIMARY KEY AUTOINCREMENT,
    employee_id INT,
    review_date DATE,
    reviewer_id INT,
    rating INT,
    comments TEXT,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
    FOREIGN KEY (reviewer_id) REFERENCES employees(employee_id)
);

CREATE TABLE benefits (
    benefit_id INTEGER PRIMARY KEY AUTOINCREMENT,
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



INSERT INTO departments (department_name, manager_id) VALUES
('Ressources Humaines', 1),
('Informatique', 2),
('Marketing', 3),
('Finance', 4),
('Ventes', 5);


INSERT INTO employees (lastName, firstName, departmentId, title_id, hire_date, email, phone_number, salary, address, date_of_birth) VALUES
('Dupont', 'Jean', 1, 1, '2020-01-15', 'jean.dupont@example.com', '0123456789', 50000, '123 Rue de Paris', '1980-05-20'),
('Martin', 'Sophie', 2, 2, '2019-03-10', 'sophie.martin@example.com', '0987654321', 45000, '456 Avenue de Lyon', '1985-07-15'),
('Bernard', 'Luc', 3, 3, '2018-07-25', 'luc.bernard@example.com', '0123987654', 40000, '789 Boulevard de Marseille', '1990-10-30'),
('Durand', 'Marie', 4, 4, '2021-05-05', 'marie.durand@example.com', '0654321987', 42000, '321 Rue de Lille', '1992-12-10'),
('Petit', 'Paul', 5, 5, '2017-11-20', 'paul.petit@example.com', '0789456123', 47000, '654 Rue de Bordeaux', '1988-03-25');

INSERT INTO titles (title_name) VALUES
('Manager'),
('Développeur'),
('Marketeur'),
('Analyste Financier'),
('Commercial');

INSERT INTO performance_reviews (employee_id, review_date, reviewer_id, rating, comments) VALUES
(1, '2021-12-15', 2, 5, 'Excellent travail tout au long de l''année.'),
(2, '2021-11-10', 1, 4, 'Bonnes performances, quelques améliorations possibles.'),
(3, '2021-10-05', 1, 3, 'Performance moyenne, besoin de plus de formation.'),
(4, '2021-09-20', 3, 4, 'Très bon travail, continuez comme ça.'),
(5, '2021-08-25', 4, 5, 'Excellente performance, continuez votre bon travail.');

INSERT INTO benefits (benefit_name, description) VALUES
('Assurance Santé', 'Couverture complète des frais médicaux.'),
('Plan de Retraite', 'Plan de retraite avec contribution de l''employeur.'),
('Congés Payés', '30 jours de congés payés par an.'),
('Formation', 'Accès à des formations professionnelles.'),
('Tickets Restaurant', 'Tickets restaurant pour les repas.');

INSERT INTO employee_benefits (employee_id, benefit_id, start_date, end_date) VALUES
(1, 1, '2020-01-15', NULL),
(2, 2, '2019-03-10', NULL),
(3, 3, '2018-07-25', NULL),
(4, 4, '2021-05-05', NULL),
(5, 5, '2017-11-20', NULL);