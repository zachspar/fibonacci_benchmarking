#include <iostream>

using namespace std;

typedef unsigned long long int vlong;


void usage() {
    cout << "Usage:  ./fib_rec  <NUMBER>\n\n"; 
}

vlong fib(vlong num, vlong a = 0, vlong b = 1) {
    if (num == (vlong)0)
        return (vlong)a;
    else if (num == (vlong)1)
        return (vlong)b;
    else
        return fib(num-(vlong)1, b, (vlong)(a + b));
}

int main(int argc, char** argv) {
    if (argc <= 1) {
        cout << "Error: please provide input number argument!\n";
        usage();
        exit(1);
    }

    vlong num = static_cast<vlong>(stoi(argv[1]));
    cout << fib(num) << endl;
}

