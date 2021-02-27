const employeePrototype = {
        raiseSalary(percent) {
            this.salary *= (1 + percent / 100);
        }
};

function createEmployee(name, salary) {
    const result = { name, salary };
    Object.setPrototypeOf(result, employeePrototype);

    return result;
};

// ----------------------------------------------
const Bond1 = createEmployee('James Bond', 100000);
const Bond2 = createEmployee('John Bond', 45000);

console.log({Bond1});
console.log({Bond2});

// ----------------------------------------------
Bond1.raiseSalary(10);
console.log({Bond1});

// ----------------------------------------------
Bond1.raiseSalary = function(percent) {
    this.salary = Number.MAX_VALUE;
};

Bond1.raiseSalary(10);
console.log({Bond1});

Bond2.raiseSalary(10);
console.log({Bond2});
