# Driver program to benchmark
# the Fibonacci sequence against
# multiple programming languages 
# such as Perl, C++, Python, Java, Scheme(r5rs), and Rust
#   --> OUTPUT CSV :: file,language,input_number,time

use Time::HiRes qw(time);


# create temp number files impl
sub create_tmp_nums {
    # Note this function is only used
    # for the scheme implementation 
    # of the Fibonacci function!
    #
    # It is a hacky way of avoiding the
    # use of CLI args to the scheme program.
    print "Creating temp number dirs [1-40]\n";

    system "mkdir ./tmp";
    my $cmd = "touch ./tmp/{1..500}.txt";
    print "Running command ::   $cmd\n";

    my $code = system $cmd;
    if ($code != 0) { die "Error: could not create tmp number dirs" }

    opendir $dh, "./tmp" or die "Error: could not open tmp dir!";
    my @num_dirs = readdir $dh
        or die "Error: cannot read files from ./tmp";
    closedir $dh or die "Error: cannot close tmp dir, $!";

    foreach (sort @num_dirs) {
      next if $_ eq "." or $_ eq "..";
        my $num = $_ =~ s/\.txt//r;
        open $fh, ">", "./tmp/$_"
            or die "Error: cannot open file $_, $!";
        print $fh $num."\n";
        close $fh or die "Error: cannot close file $_, $!"
    }
}


# generic output to csv function helper 
sub csv_out($$$$) {
    my ($fh, $language, $number, $time) = @_;
    print $fh "$language,$number,$time\n"
        or die "Error: cannot write to file, $!"
}


# main subroutine impl
sub main {
    # language -> (command, file) hash map
    my $pwd = `pwd`;
    my %files = (
        "cpp" => ["./", "cpp/fib_rec"],
        "perl"  => ["perl ", "pl/fib.pl"],
        "python" => ["python3 ", "py/fib.py"],
        # "scheme" => ["/Applications/scheme/bin/plt-r5rs ", "fib.scm<"],
        "rust" => ["./rs/target/debug/", "rs"],
    );

    # open outfile
    open my $fh, ">", "bench_test.csv"
        or die "Error: couldn't open file, $!";

    # iterate thru all numbers 0-40
    print $fh "language,input_num,time\n";
    foreach (keys %files) {
        if ($_ eq "scheme") {
            opendir my $dh, "./tmp"
                or die "Error: cannot open tmp dir to read number files, $!";
            my @number_files = readdir $dh
                or die "Error: cannot read files in tmp dir, $!";
            closedir $dh;

            my @cmd = @files{$_};
            my $scm_filename = $_;
            my $language = $_;
            foreach (sort @number_files) {
              next if $_ eq "." or $_ eq "..";
                my $delta = time;
                print "$language INPUT: < $_ > -->   [ $scm_filename ]\n";
                system "@cdm$_";
                $delta = time - $delta;
                csv_out($fh, $language, $_=~s/\.txt//r, $delta)
            }
        }
        else {
            for (my $i = 0; $i <= 40; ++$i) {
            # iterate thru hash
                my $cmd = $files{$_}[0];
                my $file = $files{$_}[1];

                # start timer
                my $delta = time;

                # execute command
                print "$_ INPUT: < $i > -->   [ $file ]\n";
                system "$cmd$file $i > /dev/null 2>&1";

                # calc time delta --> end timer
                $delta = time - $delta;

                # output csv format
                print $fh "$_,$i,$delta\n"
                  or die "Error: could not write to file, $!";
            }
        }
    }

    # close file
    close $fh or die "Error: could not close file, $!"
}

# create temp number files
print "Creating temp number files\n";
create_tmp_nums;

# main call
print "Running main subroutine\n";
my $tt_delta = time;
main;
$tt_delta = time - $tt_delta;

print "Removing temp number files\n";
system "rm -rf ./tmp";

print "Total testing time :    [ $tt_delta ]\n"

