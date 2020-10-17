# Работа с репозиториями для лабораторных работ

## Проверка заданий
* На andrvpopov@gmail.com приходит письмо о новом Pull Request в репозиторий andpop-mrsu/402_test. Смотрим, из какого репозитория пришел запрос (andpop/402_test, ветка Task01).
* Берем предложенные изменения из чужого репозитория, сливаем со своей веткой master в локальном репозитории.
```sh
cd ~/labs_mrsu/402_test
git checkout master
git remote add student https://github.com/andpop/402_test.git
git fetch student
git merge student/Task01
```
* Проверяем все в локальном репозитории. После проверки выгружаем все в master в свой репозиторий andpop-mrsu/402_test.
```sh
git push teacher master
```
* Pull Request при этом автоматически закроется.
