## Lab Assignment 4. Data Retrieval Using SQL

### Task
- Create the **movies_rating.db** database using the **db_init.sql** script prepared in Lab Assignment 2. **This script must execute in no more than 2 seconds!**
- Write SQL queries to retrieve data from **movies_rating.db**, using grouping, sorting, built-in functions, conditional logic, subqueries, window functions, and Common Table Expressions (CTEs).

1. **Find all pairs of distinct users who rated the same movie.** Eliminate duplicate pairs and ensure no user is paired with themselves. For each pair, display both users’ full names and the title of the movie they rated. Keep only the first 100 records.
2. **Find the 10 oldest ratings given by different users.** Display the movie title, user’s full name, rating value, and rating date formatted as YYYY-MM-DD.
3. **List all movies with the highest average rating and all movies with the lowest average rating in a single result set.** Sort the combined list by release year and then by title. Add a column named **"Recommended"** that contains **"Yes"** for top-rated movies and **"No"** for lowest-rated ones.
4. **Calculate the total number of ratings and the average rating assigned by male users between 2011 and 2014 (inclusive).**
5. **List movies along with their average rating and the number of users who rated them.** Sort the resulting list by release year and then by title. Keep only the first 20 records.
6. **Determine the most common movie genre and the number of movies in that genre.** Do not use a separate genres table—extract genres directly from the *movies* table (genres are stored as a pipe-separated string).
7. **Display the 10 most recently registered users in the format "Lastname Firstname|Registration Date"** (last name first, then first name).
8. **Using a recursive CTE, determine on which days of the week your birthday fell in each year.**

- Prepare a cross-platform shell script named **task4.bat** that includes:
  - Creation and population of the **movies_rating.db** database using **db_init.sql**,
  - A description of each task,
  - Execution of the corresponding SQL query for each task.

The script should follow this structure:

```bash
#!/bin/bash
chcp 65001

sqlite3 movies_rating.db < db_init.sql

echo "1. Find all pairs of distinct users who rated the same movie. Eliminate duplicate pairs and ensure no user is paired with themselves. For each pair, display both users’ full names and the title of the movie they rated. Keep only the first 100 records."
echo --------------------------------------------------
sqlite3 movies_rating.db -box -echo "SELECT ..."
echo " "

echo "2. Find the 10 oldest ratings given by different users. Display the movie title, user’s full name, rating value, and rating date formatted as YYYY-MM-DD."
echo --------------------------------------------------
sqlite3 movies_rating.db -box -echo "SELECT ..."
```

#### Additional Requirements:
- The **task4.bat** file must be saved in **UTF-8 encoding**.
- All text following the `echo` command must be enclosed in **double quotes**.
- After adding **task4.bat** to the Git index (`git add ...`), mark it as executable for Linux systems:
  ```bash
  git update-index --chmod=+x task4.bat
  ```

---

### Formatting and Code Requirements
- Perform all work in the **Task04** branch of your Git repository.
- The **Task04** directory must contain exactly two files: **db_init.sql** and **task4.bat**.

---

### Submission Procedure
The process for submitting the assignment for review and managing repositories after grading is described in the file **[Git_instruction.md](Git_instruction.md)**.
