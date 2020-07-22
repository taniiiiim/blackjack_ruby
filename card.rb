# カードを定義するファイル

require './constants'
require './error'

class Card
	attr_accessor :type, :number

	def initialize(type, number)
		begin
			# typeのバリデーションを行う
			raise InvalidTypeError unless CARD_TYPES.include?(type)
			# numberのバリデーションを行う
			raise InvalidNumberError unless CARD_NUMBERS.include?(number)
	  	@type = type
		  @number = number
		rescue => error
			error.log
		end
	end

  # カードのnumberとタイプを自己紹介するメソッド
  def show
		number + " of " + type
	end

	# numberを点数に変換するメソッド
	# J, Q, Kを引いたときに10に変換する。Aのときは一旦1に変換し、手札のscoreの合計値を見て11にするかで10を足すかどうか判断する。
	def to_score
	  if FACE_CARD_NUMBERS.include?(number)
		  FACE_CARD_VALUE
	  elsif number == ACE_NUMBER
	  	ACE_VALUES[0]
	  else
		  number.to_i
	  end
	end
end
