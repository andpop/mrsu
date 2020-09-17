<?php

function outer()
{
    echo "Hello from outer\n";

    function inner()
    {
        echo "Hello from inner\n";
    }
}

/* inner(); */

outer();
inner();


$a = 1;

function f2()
{
    echo "a = ${a}";
}

f2();
