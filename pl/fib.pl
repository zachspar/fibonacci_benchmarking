use strict;

# std fib calc in recursive impl
sub fib {
    my $num = shift;
    if ($num == 0) { # case 1
        return 0;
    }
    elsif ($num == 1) { # case 2
        return 1;
    }
    else { # case 3
        return fib($num - 1) + fib($num - 2);
    }
}

# main routine
sub main {
    # grab number from stdin
    my $num = $ARGV[0];

    # assert number given, or error
    if (not defined($num)) {
        die "Error: no input number";
    }

    # calc fib for number
    my $calc = fib $num;

    # print
    print "$calc\n"
}

# injection point
main

