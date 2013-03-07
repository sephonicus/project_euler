### Problem:

# In England the currency is made up of pound (£) and pence (p), and there are
# eight coins in general circulation:

# 1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).
# It is possible to make £2 in the following way:

# 1x£1 + 1x50p + 2x20p + 1x5p + 1x2p + 3x1p
# How many different ways can £2 be made using any number of coins?

### Solution:

COINS = [200, 100, 50, 20, 10, 5, 2, 1]

def smaller_coin(coin)
  COINS[COINS.index(coin) + 1]
end

def determine_possibilities(amount, coin)
  return 0 unless coin
  possibilities = 0
  0.upto(amount / coin) do |i|
    remaining = amount - coin * i
    if remaining > 0
      possibilities += determine_possibilities(remaining, smaller_coin(coin))
    else
      possibilities += 1
    end
  end
  possibilities
end

puts determine_possibilities(200, 200)
