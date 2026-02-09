## Lab Assignment 1. Environment Setup for Completing Tasks and Interactive Work with the SQLite DBMS

### GitHub and Git Configuration
- Register on GitHub and fork your repository from https://github.com/andpop-mrsu.  
- Install Git on your local machine and perform initial configuration (`git config --global user.name`, `git config --global user.email`).  
- Clone the forked repository from your GitHub profile to your local machine (`git clone`). The remote repository in your profile will be linked under the name *origin*.  
- Add a link to the original repository under the name *upstream* (`git remote add upstream https://github.com/andpop-mrsu/303_XXX_XX.git`).  
- Create a local branch named **Task01** and continue working in this branch.

### Preparing Data for Task Completion
- Create a directory named **Task01**.  
- Copy the source data files from the **dataset** directory.  
- Create a file named **ratings_count.txt** and write the following two lines into it:  
  - The minimum user ID from **ratings.csv** along with the number of rows containing this ID.  
  - The maximum user ID from **ratings.csv** along with the number of rows containing this ID.

### Installing SQLite
- Install the SQLite DBMS on your computer. Determine which files are required for its operation.  
- Experiment with the interactive mode using the standard command-line client **sqlite3**.  
- Create a file named **sqlite.txt** and record in it:  
  - The version number of the installed SQLite.  
  - The available output modes in the **sqlite3** utility.

### Submitting the Assignment for Review
- Add a **README.md** file (in Markdown format) describing the structure of the data files.  
- Commit all changes in the **Task01** branch (the **Task01** folder must contain all original data files as well as **README.md**, **ratings_count.txt**, and **sqlite.txt**).  
- Push the commit to your forked repository on GitHub (`git push origin`).  
- Create a Pull Request to merge your **Task01** branch from your personal repository into https://github.com/andpop-mrsu.  
- The assignment will be considered accepted once the Pull Request is closed in https://github.com/andpop-mrsu.  
- After the instructor accepts your work, synchronize your local repository with the original one (`git pull upstream master`), then update your GitHub repository (`git push origin master`).

---

### Additional Lectures
- Working with the Command Line and Git on Windows: https://youtu.be/UM6jaYa1YY8  

### Topics for Study
- **Version Control System Git**  
  - https://git-scm.com/book/ru/v2/ — S. Chacon, B. Straub, "Pro Git" (Russian translation).  
  - https://learn.javascript.ru/screencast/git — Git screencast by Ilya Kantor.  

- **GitHub Web Service for Hosting and Collaborative Development of IT Projects**  
  - https://youtu.be/pUT3mx1ZR — “Pull Request in Open Source” by Hexlet. A guide on using Pull Requests to contribute code to open-source projects (our submission process follows exactly this workflow).  

- **Embedded Database SQLite**  
  - https://www.sqlite.org/docs.html — Official SQLite documentation.  
  - J. A. Kreibich, *Using SQLite*, O’Reilly, 2010.  
  - G. Allen, M. Owens, *The Definitive Guide to SQLite*, 2nd ed., Apress, 2010.  

- **Markdown Markup Language**  
  - https://guides.hexlet.io/markdown/ — Overview of core features.  
  - https://guides.github.com/pdfs/markdown-cheatsheet-online.pdf — Markdown cheat sheet.
