gem 'minitest'
require 'minitest/autorun'

require './palindrome'

describe Palindrome do
  describe 'palindrome?' do
    it 'returns true if the number is a palindrome' do
      Palindrome.palindrome?(1).must_equal true
      Palindrome.palindrome?(88).must_equal true
      Palindrome.palindrome?(12321).must_equal true
    end

    it 'returns false if the number is not a palindrome' do
      Palindrome.palindrome?(12).must_equal false
      Palindrome.palindrome?(302).must_equal false
      Palindrome.palindrome?(12320).must_equal false
    end
  end
end
