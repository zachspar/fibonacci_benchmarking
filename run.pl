# Driver program to benchmark
# the Fibonacci sequence against
# multiple programming languages 
# such as Perl, C++, Python, Java, Scheme, and Rust
#   --> OUTPUT CSV :: file,language,input_number,time

use Time::HiRes qw(time);

sub main {
    # language -> (command, file) hash map
    my $pwd = `pwd`;
    my %files = (
        "cpp" => ["./", "cpp/fib_rec"],
        "perl"  => ["perl ", "pl/fib.pl"],
        # "scheme" => ["/Applications/scheme/bin/plt-r5rs ", "fib.scm"],
    );

    # open outfile
    open my $fh, ">", "bench.test"
        or die "Error: couldn't open file, $!";

    # iterate thru all numbers 0-40
    print $fh "language,file,input_num,time\n";
    for (my $i = 0; $i <= 40; ++$i) {
        # iterate thru hash
        foreach (keys %files) {
            my $cmd = $files{$_}[0];
            my $file = $files{$_}[1];
            my $delta = time;

            # execute command
            system "$cmd$file $i > /dev/null 2>&1";

            # calc time delta
            $delta = time - $delta;

            # output csv format
            print $fh "$_,$file,$i,$delta\n"
              or die "Error: could not write to file, $!";
        }
    }

    # close file
    close $fh or die "Error: could not close file, $!"
}

# main call
main

