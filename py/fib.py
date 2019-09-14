import sys


def usage():
    print("Usage: python3 fib.py <NUMBER> ")


def fib(num):
    if num == 0:
        return 0
    elif num == 1:
        return 1
    else:
        return fib(num-1) + fib(num-2)


def main():
    if len(sys.argv) < 2:
        usage()
        raise(Exception("Error: not enough input arguments!"))

    fib(int(sys.argv[1]))


if __name__ == "__main__":
    main()

