# Lily likes to play games with integers and their reversals. For some integer x,
# we define reversed(x) to be the reversal of all digits in x.
# For example, reversed(123) = 321, reversed(12) = 21, and reversed(120) = 21.
#
# Logan wants to go to the movies with Lily on some day x satisfying i <= x <= j,
# but he knows she only goes to the movies on days she considers to be beautiful.
# Lily considers a day to be beautiful if the absolute value of the difference
# between x and reversed(x) is evenly divisible by k.
#
# Given i, j, and k, count and print the number of beautiful days when Logan and Lily can go to the movies.
#
# Input Format
#
# A single line of three space-separated integers describing the respective values of i, j and k.
#
# Constraints
#
# 1<= i <= j <= 2 * 10^6
# 1 <= k <= 2 * 10^9
#
# Output Format
#
# Print the number of beautiful days in the inclusive range between j and k.
#
# Sample Input
#
# 20 23 6
#
# Sample Output
#
# 2

my $row = <STDIN>;
chomp$row;
my ($i, $j, $k) = split / /, $row;

my $res = 0;
for ($cur = scalar $i; $cur <= $j; $cur = $cur + 1) {
    my $rev = reverse $cur;
    if (($cur - $rev) % $k == 0) {
        $res = $res + 1;
    }
}

print $res;