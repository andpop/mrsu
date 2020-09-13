var glob = 1;
function outer() {
    var a = glob;

    const inner = function() {
        return a;
    }

    // a = 2;

    return inner;
}

var f = outer();

glob = 2; 

console.log(f());
