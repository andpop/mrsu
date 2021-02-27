function createEmployee(name, salary) {
    return {
        name,
        salary,
        // У каждого объекта будет своя функция
        raiseSalary(percent) {
            this.salary *= (1 + percent / 100);
        }
    };
};

const Bond1 = createEmployee('James Bond', 100000);
const Bond2 = createEmployee('John Bond', 45000);

console.log({Bond1});
console.log({Bond2});

