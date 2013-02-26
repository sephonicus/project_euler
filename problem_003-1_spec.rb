require 'rubygems'
gem 'minitest'
require 'minitest/autorun'

require './problem_003-1'

describe 'prime?(number)' do
  it 'returns false when passed numbers less than 2' do
    prime?(1).must_equal  false
    prime?(0).must_equal  false
    prime?(-1).must_equal false
    prime?(-2).must_equal false
  end
  it 'returns false when passed a composite numbers' do
    prime?(4).must_equal false
  end
  it 'returns true when passed prime numbers' do
    prime?(2).must_equal  true
    prime?(7).must_equal  true
    prime?(29).must_equal true
  end
end

describe 'primes_through(number)' do
  before do
    $last_tested = 1
    $primes = []
  end
  it 'leaves an empty list when no primes are found' do
    primes_through(1)
    $primes.must_equal []
  end
  it 'generates an ordered list of primes up to the given maximum' do
    primes_through(13)
    $primes.must_equal [2, 3, 5, 7, 11, 13]
  end
  it 'adds additional primes to the list if necessary' do
    primes_through(11)
    $primes.must_equal [2, 3, 5, 7, 11]
    primes_through(13)
    $primes.must_equal [2, 3, 5, 7, 11, 13]
  end
  it 'adds at least one additional prime to the list so that work is not repeated' do
    primes_through(7)
    $primes.must_equal [2, 3, 5, 7]
    primes_through(8)
    $primes.must_equal [2, 3, 5, 7, 11]
  end
end
