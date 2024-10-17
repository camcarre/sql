const express = require('express');
const path = require('path');
const sqlite3 = require('sqlite3').verbose();

const app = express();
const port = 3000;

const dbPath = path.resolve(__dirname, '/Users/camcam/Documents/taffpro/sql/sql/back/employees.db');
console.log('Chemin absolu de la base de données:', dbPath);

const db = new sqlite3.Database(dbPath, (err) => {
    if (err) {
        console.error('Erreur de connexion à la base de données:', err.message);
    } else {
        console.log('Connecté à la base de données SQLite.');
    }
});

app.use(express.static(path.join(__dirname, '../front')));

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