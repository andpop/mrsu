## Lab Assignment 3. Data Retrieval Using the SQL SELECT Statement

### Task
- Create the **movies_rating.db** database using the **db_init.sql** script prepared in Lab Assignment 2. **This script must execute in no more than 2 seconds!**
- Write SQL queries to retrieve data from **movies_rating.db** (queries may involve one or multiple tables, sorting, grouping, and built-in functions).

1. **List all movies that have at least one rating.** Sort the list by release year and then by title. Keep only the first 10 movies.
2. **List all users whose last names (not first names!) start with the letter 'A'.** Sort the resulting list by registration date. Keep only the first 5 users.
3. **Write a query that returns rating information in a more readable format:** reviewer’s first and last name, movie title, release year, rating value, and rating date formatted as YYYY-MM-DD. Sort the results by reviewer’s first name, then by movie title, then by rating. Keep only the first 50 records.
4. **List all movies along with the tags assigned to them by users.** Sort by release year, then by movie title, then by tag. Keep only the first 40 records.
5. **List the most recent movies.** The result should include all movies released in the latest year present in the database. The query must be generic—it must determine the latest year dynamically rather than hardcoding it.
6. **Find all dramas released after 2005 that were liked by female users (rating ≥ 4.5).** For each such movie, display its title, release year, and the number of qualifying ratings. Sort the results by release year and then by title.
7. **Analyze platform popularity over time:** display the number of users who registered on the site in each calendar year. Identify the years with the highest and lowest numbers of registrations.

- Prepare a cross-platform shell script named **task3.bat** that includes:
  - Creation and population of the **movies_rating.db** database using **db_init.sql**,
  - A description of each task,
  - Execution of the corresponding SQL query for each task.

The script should follow this structure:

```bash
#!/bin/bash
chcp 65001

sqlite3 movies_rating.db < db_init.sql

echo "1. List all movies that have at least one rating. Sort the list by release year and then by title. Keep only the first 10 movies."
echo --------------------------------------------------
sqlite3 movies_rating.db -box -echo "SELECT ..."
echo " "

echo "2. List all users whose last names (not first names!) start with the letter 'A'. Sort the resulting list by registration date. Keep only the first 5 users."
echo --------------------------------------------------
sqlite3 movies_rating.db -box -echo "SELECT ..."
```

#### Additional Requirements:
- The **task3.bat** file must be saved in **UTF-8 encoding**.
- All text following the `echo` command must be enclosed in **double quotes**.
- After adding **task3.bat** to the Git index (`git add ...`), mark it as executable for Linux systems:
  ```bash
  git update-index --chmod=+x task3.bat
  ```

---

### Formatting and Code Requirements
- Perform all work in the **Task03** branch of your Git repository.
- The **Task03** directory must contain exactly two files: **db_init.sql** and **task3.bat**.

---

### Submission Procedure
The process for submitting the assignment for review and managing repositories after grading is described in the file **[Git_instruction.md](Git_instruction.md)**.
