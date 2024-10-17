CREATE TABLE employees (
  employee_id INT PRIMARY KEY,
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
  status VARCHAR(20), -- Options could be 'Present', 'Absent', 'Leave', etc.
  clock_in_time TIME,
  clock_out_time TIME,
  FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

CREATE TABLE performance_reviews (
  review_id INT PRIMARY KEY,
  employee_id INT,
  review_date DATE,
  reviewer_id INT,
  rating INT CHECK (rating BETWEEN 1 AND 5), -- Rating on a scale of 1-5
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
