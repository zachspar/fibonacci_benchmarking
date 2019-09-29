use std::env;

// Fibonacci function written using simple matches
// and non-tail recursive impl
fn fib(num: i128) -> i128 {
    match num {
        0 => 0,
        1 => 1,
        _ => fib(num-1) + fib(num-2)
    }
}


// main
fn main() {
    // get args from command line
    let args: Vec<String> = env::args().collect();

    // convert num to signed 128 bit
    let num: i128 = args[1].parse().unwrap();

    // print out the fib num
    println!("{}", fib(num));
}

