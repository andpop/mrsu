var glob = 1;
function outer() {
    var a = glob;

    const inner = function() {
        return a;
    }

    return inner;
}

var f = outer();

glob = 2; 

console.log(f());   // 1

console.log('=====================================');

function outer2() {
    var b = 1;
    setTimeout(() => console.log('b = ', b), 5000);

    b = 10;
}

outer2();
