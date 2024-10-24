const express = require('express');
const path = require('path');
const sqlite3 = require('sqlite3').verbose();
const bodyParser = require('body-parser');

const app = express();
const port = 3000;

const dbPath = path.resolve(__dirname, '/Users/tayvadiphaisan/sql/back/employees.db');
console.log('Chemin absolu de la base de données:', dbPath);

const db = new sqlite3.Database(dbPath, (err) => {
    if (err) {
        console.error('Erreur de connexion à la base de données:', err.message);
    } else {
        console.log('Connecté à la base de données SQLite.');
    }
});

app.use(express.static(path.join(__dirname, '../front')));
app.use(bodyParser.json());

// get
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, '../front', 'index.html'));
});

app.get('/bddview', (req, res) => {
    res.sendFile(path.join(__dirname, '../front', 'bddview.html'));
});

app.get('/api/employees', (req, res) => {
    const sql = `
        SELECT employee_id, lastName, firstName, email, phone_number, departmentId, title_id, hire_date, salary, address, date_of_birth
        FROM employees
    `;
    db.all(sql, [], (err, rows) => {
        if (err) {
            res.status(400).json({ error: err.message });
            return;
        }
        res.json(rows);
    });
});

app.get('/api/departments', (req, res) => {
    const sql = `
        SELECT departmentId, department_name, manager_id
        FROM departments
    `;
    db.all(sql, [], (err, rows) => {
        if (err) {
            res.status(400).json({ error: err.message });
            return;
        }
        res.json(rows);
    });
});

app.get('/api/titles', (req, res) => {
    const sql = `
        SELECT title_id, title_name
        FROM titles
    `;
    db.all(sql, [], (err, rows) => {
        if (err) {
            res.status(400).json({ error: err.message });
            return;
        }
        res.json(rows);
    });
});

app.get('/api/attendance', (req, res) => {
    const sql = `
        SELECT attendance_id, employee_id, date, status, clock_in_time, clock_out_time
        FROM attendance
    `;
    db.all(sql, [], (err, rows) => {
        if (err) {
            res.status(400).json({ error: err.message });
            return;
        }
        res.json(rows);
    });
});

app.get('/api/performance_reviews', (req, res) => {
    const sql = `
        SELECT review_id, employee_id, review_date, reviewer_id, rating, comments
        FROM performance_reviews
    `;
    db.all(sql, [], (err, rows) => {
        if (err) {
            res.status(400).json({ error: err.message });
            return;
        }
        res.json(rows);
    });
});

app.get('/api/benefits', (req, res) => {
    const sql = `
        SELECT benefit_id, benefit_name, description
        FROM benefits
    `;
    db.all(sql, [], (err, rows) => {
        if (err) {
            res.status(400).json({ error: err.message });
            return;
        }
        res.json(rows);
    });
});

app.get('/api/employee_benefits', (req, res) => {
    const sql = `
        SELECT employee_id, benefit_id, start_date, end_date
        FROM employee_benefits
    `;
    db.all(sql, [], (err, rows) => {
        if (err) {
            res.status(400).json({ error: err.message });
            return;
        }
        res.json(rows);
    });
});

// delete

app.delete('/api/employees/:id', (req, res) => {
    const { id } = req.params;
    const sql = 'DELETE FROM employees WHERE employee_id = ?';
    db.run(sql, id, function(err) {
        if (err) {
            res.status(400).json({ error: err.message });
            return;
        }
        res.json({ message: 'Employé supprimé avec succès!', changes: this.changes });
    });
});

app.delete('/api/departments/:id', (req, res) => {
    const { id } = req.params;
    const sql = 'DELETE FROM departments WHERE departmentId = ?';
    db.run(sql, id, function(err) {
        if (err) {
            res.status(400).json({ error: err.message });
            return;
        }
        res.json({ message: 'Département supprimé avec succès!', changes: this.changes });
    });
});

app.delete('/api/titles/:id', (req, res) => {
    const { id } = req.params;
    const sql = 'DELETE FROM titles WHERE title_id = ?';
    db.run(sql, id, function(err) {
        if (err) {
            res.status(400).json({ error: err.message });
            return;
        }
        res.json({ message: 'Titre supprimé avec succès!', changes: this.changes });
    });
});

app.delete('/api/attendance/:id', (req, res) => {
    const { id } = req.params;
    const sql = 'DELETE FROM attendance WHERE attendance_id = ?';
    db.run(sql, id, function(err) {
        if (err) {
            res.status(400).json({ error: err.message });
            return;
        }
        res.json({ message: 'Présence supprimée avec succès!', changes: this.changes });
    });
});

app.delete('/api/performance_reviews/:id', (req, res) => {
    const { id } = req.params;
    const sql = 'DELETE FROM performance_reviews WHERE review_id = ?';
    db.run(sql, id, function(err) {
        if (err) {
            res.status(400).json({ error: err.message });
            return;
        }
        res.json({ message: 'Évaluation de performance supprimée avec succès!', changes: this.changes });
    });
});

app.delete('/api/benefits/:id', (req, res) => {
    const { id } = req.params;
    const sql = 'DELETE FROM benefits WHERE benefit_id = ?';
    db.run(sql, id, function(err) {
        if (err) {
            res.status(400).json({ error: err.message });
            return;
        }
        res.json({ message: 'Bénéfice supprimé avec succès!', changes: this.changes });
    });
});

app.delete('/api/employee_benefits/:employee_id/:benefit_id', (req, res) => {
    const { employee_id, benefit_id } = req.params;
    const sql = 'DELETE FROM employee_benefits WHERE employee_id = ? AND benefit_id = ?';
    db.run(sql, [employee_id, benefit_id], function(err) {
        if (err) {
            res.status(400).json({ error: err.message });
            return;
        }
        res.json({ message: 'Bénéfice de l\'employé supprimé avec succès!', changes: this.changes });
    });
});

// post 
app.post('/api/employees', (req, res) => {
    const { lastName, firstName, email, phone_number, departmentId, title_id, hire_date, salary, address, date_of_birth } = req.body;
    const sql = `INSERT INTO employees (lastName, firstName, email, phone_number, departmentId, title_id, hire_date, salary, address, date_of_birth)
                 VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`;
    db.run(sql, [lastName, firstName, email, phone_number, departmentId, title_id, hire_date, salary, address, date_of_birth], function(err) {
        if (err) {
            return res.status(400).json({ error: err.message });
        }
        res.json({ message: 'Employé ajouté avec succès!', id: this.lastID }); // this.lastID returns the new employee_id
    });
});

app.post('/api/departments', (req, res) => {
    const { department_name, manager_id } = req.body;
    const sql = `INSERT INTO departments (department_name, manager_id) VALUES (?, ?)`;

    db.run(sql, [department_name, manager_id], function(err) {
        if (err) {
            return res.status(400).json({ error: err.message });
        }
        res.status(201).json({ message: 'Départment ajouté avec succès!', id: this.lastID }); // this.lastID returns the new departmentId
    });
});

app.post('/api/titles', (req, res) => {
    const { title_name } = req.body;
    const sql = `INSERT INTO titles (title_name) VALUES (?)`;

    db.run(sql, [title_name], function(err) {
        if (err) {
            return res.status(400).json({ error: err.message });
        }
        res.status(201).json({ message: 'Titre ajouté avec succès!', id: this.lastID }); // this.lastID returns the new title_id
    });
});

app.post('/api/benefits', (req, res) => {
    const { benefit_name, description } = req.body;
    const sql = `INSERT INTO benefits (benefit_name, description) VALUES (?, ?)`;

    db.run(sql, [benefit_name, description], function(err) {
        if (err) {
            return res.status(400).json({ error: err.message });
        }
        res.status(201).json({ message: 'Bénéfices ajouté avec succès!', id: this.lastID }); // this.lastID returns the new benefit_id
    });
});

app.post('/api/performance_reviews', (req, res) => {
    const { employee_id, review_date, reviewer_id, rating, comments } = req.body;
    const sql = `INSERT INTO performance_reviews (employee_id, review_date, reviewer_id, rating, comments) 
                 VALUES (?, ?, ?, ?, ?)`;

    db.run(sql, [employee_id, review_date, reviewer_id, rating, comments], function(err) {
        if (err) {
            return res.status(400).json({ error: err.message });
        }
        res.status(201).json({ message: 'Avis de performance ajouté avec succès!', id: this.lastID }); // this.lastID returns the new review_id
    });
});


// serve

app.listen(port, () => {
    console.log(`Server is running on http://localhost:${port}`);
});

process.on('SIGINT', () => {
    db.close((err) => {
        if (err) {
            console.error('Erreur lors de la fermeture de la base de données:', err.message);
        } else {
            console.log('Connexion à la base de données SQLite fermée.');
        }
        process.exit(0);
    });
});
