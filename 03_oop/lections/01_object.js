const Bond1 = {name: 'James Bond', salary: 50000};

const Bond2 = {name: 'James Bond', salary: 50000};

console.log(Bond1 === Bond2);

const Bond = {
    name: 'James Bond', 
    salary: 50000,
    raiseSalary: function(percent) {
        this.salary *= (1 + percent / 100);
    }
};

Bond.raiseSalary(10);
console.log({Bond});

const anotherBond = {
    name: 'John Bond',
    salary: 42000,
    raiseSalary(percent) {
        this.salary *= (1 + percent / 100);
    }
};

anotherBond.raiseSalary(20);
console.log({anotherBond});
