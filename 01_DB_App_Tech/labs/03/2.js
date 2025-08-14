var a = 1;

function f() {
    console.log(a); // 2
    let a = 2;
    console.log(a);
}

f();
