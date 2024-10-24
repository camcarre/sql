# Final SQL Project 🎯

## Table of Contents 📚

1. [Project Description](#project-description)
2. [Requirements](#requirements)
   - [1. Node.js](#1-nodejs)
   - [2. NPM (Node Package Manager)](#2-npm-node-package-manager)
   - [3. Dependencies](#3-dependencies)
   - [4. Directory Structure](#4-directory-structure)
   - [5. Database File](#5-database-file)
   - [6. Run the Application](#6-run-the-application)

## Project Description 📝
At the end of our SQL module, we were tasked to create a database interface in order to store information on a business’s employees. We were tasked to create SQL queries to extract information from the database and display it on a web page. We also used HTML and CSS concepts to create a user-friendly interface for displaying the information from the database. HTML forms to allow users to input information and send it to the database via SQL queries were used. We also created navigation pages to allow users to browse different sections of the site by clicking on buttons, all while using JavaScript concepts to add interactive features. 

**Technologies used:**
- SQLite3 🗄️
- JavaScript 💻
- HTML 🌐
- CSS 🎨

## Requirements ⚙️

### 1. Node.js 🟢
- Ensure you have Node.js installed on your machine. You can download it from the [Node.js official website](https://nodejs.org/).
- You can check if it's installed and see the version by running the following command in your terminal:
    ```bash
    node -v
    ```

### 2. NPM (Node Package Manager) 📦
- npm comes bundled with Node.js. You can check if it's installed by running:
    ```bash
    npm -v
    ```

### 3. Dependencies 🔧
- You will need to install the required packages for your application:
    ```bash
    npm install express sqlite3 body-parser
    ```

### 4. Directory Structure 🗂️
- Ensure your project has a proper directory structure. Based on your code, you should have something like this:
    ```bash
    sql/ 
        ├── back/ 
        │    ├── employees.db
        │    └── serveur.js 
        ├── data-modeler/
        │   └── data-model.sql   
        ├── front/ 
        │   ├── bddadd.css
        │   ├── bddadd.html
        │   ├── bddview.css 
        │   ├── bddview.html
        │   ├── index.html
        │   ├── index.js 
        └── style.css
    ```

### 5. Database File 🗃️
- Ensure that the SQLite database file (`employees.db`) exists at the specified path in your code:
    ```javascript
    const dbPath = path.resolve(__dirname, '/Users/tayvadiphaisan/sql/back/employees.db');
    ```

### 6. Run The Application 🚀
- To start your server, run the following command in your terminal from the project directory where `serveur.js` is located:
    ```bash
    node serveur.js
    ```
- You should see:
    ```
    Server is running on http://localhost:3000
    ```





