class Card
	
	def initialize(type, number)
		@type = type
		@number = number
	end
	
	def show
		return "#{@type} の #{@number}"
	end
	
	#J, Q, Kを引いたときに10に変換する
	def change
	  if @number === 'J' or @number == 'Q' or @number == 'K'
		return 10
	  else
		return @number.to_i
	  end
	end 
end