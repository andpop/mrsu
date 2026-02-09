## Lab Assignment 2. Preparing Scripts to Create Tables and Insert Data

### Task
Implement an ETL (Extract, Transform, Load) process to transfer source data into an SQLite database. Write a utility that generates an SQL script named **db_init.sql**, which automatically:
- Creates the required tables (`CREATE TABLE ...`)
- Loads data into them (`INSERT INTO ...`) from the original text files copied from the **dataset** directory.

#### Requirements:
- The utility must be **cross-platform** (run on different operating systems) and **execute in no more than 2 seconds**. Recommended languages: **Python** or **PowerShell**.
- The resulting database file must be named **movies_rating.db**.
- The database must contain the following tables:
  - **movies**: fields `id` (primary key), `title`, `year`, `genres`.
  - **ratings**: fields `id` (primary key), `user_id`, `movie_id`, `rating`, `timestamp`.
  - **tags**: fields `id` (primary key), `user_id`, `movie_id`, `tag`, `timestamp`.
  - **users**: fields `id` (primary key), `name`, `email`, `gender`, `register_date`, `occupation`.
- Column types and sizes must match the structure of the source text files.
- If the **movies_rating.db** database already contains any of these tables when the utility is run, they must be **dropped and recreated**.

- The utility that generates the SQL script and executes it using **sqlite3** must be launched via a cross-platform shell script named **db_init.bat** with the following content:
  ```bash
  #!/bin/bash
  python3 make_db_init.py
  sqlite3 movies_rating.db < db_init.sql
  ```
- After adding **db_init.bat** to the Git index (`git add ...`), mark it as executable for Linux systems:
  ```bash
  git update-index --chmod=+x db_init.bat
  ```

---

### Formatting and Code Requirements
- Perform all work in the **Task02** branch of your Git repository.
- Place all files inside the **Task02** directory.
- In **README.md**, describe the environment requirements needed for **db_init.bat** to run correctly (e.g., Python 3 and SQLite must be installed). After running the script, a fully populated database named **movies_rating.db** should be created.

---

### Additional Lectures
- Executable Files in Windows and Unix-like Systems: https://youtu.be/yuSveRKLUzg

---

### Submission Procedure
The process for submitting the assignment for review and managing repositories after grading is described in the file **[Git_instruction.md](Git_instruction.md)**.

---

### Topics for Study
- **Embedded Database SQLite**
  - https://www.sqlite.org/docs.html — Official SQLite documentation  
  - J. A. Kreibich, *Using SQLite*, O’Reilly, 2010  
  - G. Allen, M. Owens, *The Definitive Guide to SQLite*, 2nd ed., Apress, 2010  

- **Markdown Markup Language**
  - https://guides.hexlet.io/markdown/ — Overview of core features  
  - https://guides.github.com/pdfs/markdown-cheatsheet-online.pdf — Markdown cheat sheet
