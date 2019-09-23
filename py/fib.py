import sys


def usage():
    print("Usage: python3 fib.py <NUMBER> ")


def fib(num, a=1,b=1):
    if num == 0:
        return a
    elif num == 1:
        return b
    else:
        return fib(num-1, b, a+b)


def main():
    if len(sys.argv) < 2:
        usage()
        raise(Exception("Error: not enough input arguments!"))

    print(fib(int(sys.argv[1])))


if __name__ == "__main__":
    main()

