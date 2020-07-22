# 例外クラスを定義するファイル

class InvalidTypeError < ArgumentError
  def log
    puts "#{self}: invalid type value for Card."
  end
end

class InvalidNumberError < ArgumentError
  def log
    puts "#{self}: invalid number value for Card."
  end
end

class InvalidCardError < ArgumentError
  def log
    puts "#{self}: invalid card value exists for Deck."
  end
end

class OverLimitCardError < ArgumentError
  def log
    puts "#{self}: Too many cards for Deck (max: #{MAX_CARDS})."
  end
end
