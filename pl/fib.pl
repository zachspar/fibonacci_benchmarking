use strict;

# std fib calc in recursive impl
sub fib {
    my $num = shift;
    my $a = shift // 0; # defualt 0
    my $b = shift // 1; # default 1
    if ($num == 0) { # case 1
        return $a;
    }
    elsif ($num == 1) { # case 2
        return $b;
    }
    else { # case 3
        return fib($num - 1, $b, $a + $b);
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

