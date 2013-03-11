class Palindrome

  def self.palindrome?(n)
    digits = n.to_s.split('')
    while digits.size > 1
      unless digits.shift == digits.pop
        return false
      end
    end
    true
  end

end
