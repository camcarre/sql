## Requirements

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





