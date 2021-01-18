CREATE TABLE students (
    id INTEGER primary key autoincrement,
    name CHARACTER(20),
    lastName CHARACTER(30),
    age INTEGER,
    gender CHARACTER(1)
)

INSERT INTO students (name, lastName, age, gender) VALUES ('Ваня', 'Петров', 20, 'М')
