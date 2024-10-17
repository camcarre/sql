const express = require('express');
const path = require('path');

const app = express();
const port = 3000;

app.use(express.static(path.join(__dirname, '../front')));

app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, '../front', 'index.html'));
});

app.get('/bddview', (req, res) => {
    res.sendFile(path.join(__dirname, '../front', 'bddview.html'));
});

app.get('/bddadd', (req, res) => {
    res.sendFile(path.join(__dirname, '../front', 'bddadd.html'));
});

app.listen(port, () => {
    console.log(`Server is running on http://localhost:${port}`);
});