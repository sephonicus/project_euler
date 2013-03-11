### Problem:

# The fraction 49/98 is a curious fraction, as an inexperienced mathematician in
# attempting to simplify it may incorrectly believe that 49/98 = 4/8, which is
# correct, is obtained by cancelling the 9s.

# We shall consider fractions like, 30/50 = 3/5, to be trivial examples.

# There are exactly four non-trivial examples of this type of fraction, less
# than one in value, and containing two digits in the numerator and denominator.

# If the product of these four fractions is given in its lowest common terms,
# find the value of the denominator.

### Solution:

possibilities = []

11.upto(99) do |denominator|
  10.upto(denominator - 1) do |numerator|

    d_digits = denominator.to_s.split('')
    n_digits = numerator.to_s.split('')
    common = d_digits & n_digits
    unless common.empty?
      next if common == ['0']

      common.each do |digit|
        d_digits.each_with_index do |d, i|
          if d == digit
            n_digits.each_with_index do |n, j|
              if n == digit
                remaining_n = (n_digits[j.zero? ? 1 : 0]).to_f
                remaining_d = (d_digits[i.zero? ? 1 : 0]).to_f
                if remaining_n / remaining_d == numerator.to_f / denominator.to_f
                  possibilities.push([numerator, denominator])
                end
              end
            end
          end
        end
      end

    end

  end
end

numerator   = possibilities.map { |p| p[0] }.inject(&:*)
denominator = possibilities.map { |p| p[1] }.inject(&:*)
puts (numerator.to_f / denominator).rationalize.denominator
