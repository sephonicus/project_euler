# Hash in Ruby is written in C. Using it for generating Fibonacci numbers is not
# only fast, but you also get built-in memoization.

Fibonacci = Hash.new { |h, k| h[k] = k < 2 ? k : h[k-1] + h[k-2] }
