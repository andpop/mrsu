### Initial GitHub and Git Setup
- Register on GitHub and fork your repository from https://github.com/andpop-mrsu.  
- Install Git on your local machine and perform initial configuration:  
  ```bash
  git config --global user.name "Your Name"
  git config --global user.email "your.email@example.com"
  ```
- Clone the forked repository from your GitHub profile to your local machine (`git clone`). The remote repository linked to your profile will automatically be named **origin**.
- Add a remote link to the original (upstream) repository under the name **upstream**:  
  ```bash
  git remote add upstream https://github.com/andpop-mrsu/402_XXX_XX.git
  ```
- Create a new local branch named **TaskXX**, where **XX** is the assignment number (e.g., `git checkout -b Task01`). All your work for this assignment should be done in this branch.

### Submitting Your Assignment for Review
- Commit your solution in the local repository.
- Push the commit to your forked repository on GitHub:  
  ```bash
  git push origin TaskXX
  ```
- Create a **Pull Request** to merge your branch (**Task01**, **Task02**, etc.) from your personal repository into the target repository at https://github.com/andpop-mrsu.  
- Your assignment will be considered accepted once the Pull Request is closed in https://github.com/andpop-mrsu.

### Actions After the Instructor Accepts Your Assignment
- Synchronize your local **master** branch with the instructor’s original repository:  
  ```bash
  git pull upstream master
  ```
- Push the updated **master** branch from your local repository to your GitHub profile:  
  ```bash
  git push origin master
  ```
- Delete the feature branch (**Task01**, **Task02**, etc.) you used for the assignment in your local repository:  
  ```bash
  git branch -d TaskXX
  ```
