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

CREATE TABLE attendance (
    attendance_id INTEGER PRIMARY KEY AUTOINCREMENT,
    employee_id INT,
    date DATE,
    status VARCHAR(20), 
    clock_in_time TIME,
    clock_out_time TIME,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

CREATE TABLE performance_reviews (
    review_id INTEGER PRIMARY KEY AUTOINCREMENT,
    employee_id INT,
    review_date DATE,
    reviewer_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
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
