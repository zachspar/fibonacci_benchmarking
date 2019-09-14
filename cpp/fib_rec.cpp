#include <iostream>

using namespace std;


void usage() {
    cout << "Usage:  ./fib_rec  <NUMBER>\n\n"; 
}

long long fib(int num) {
    if (num == 0)
        return 0;
    else if (num == 1)
        return 1;
    else
        return fib(num-1) + fib(num-2);
}

int main(int argc, char** argv) {
    if (argc <= 1) {
        cout << "Error: please provide input number argument!\n";
        usage();
        exit(1);
    }

    int num = stoi(argv[1]);
    cout << fib(num) << endl;
}

