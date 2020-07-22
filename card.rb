class Card
	
	def initialize(type, number)
		@type = type
		@number = number
	end
	
	def show
		return "#{@type} の #{@number}"
	end
	def number
		return @number
		
	end
	
	#J, Q, Kを引いたときに10に変換する
	def change
	  if @number === 'J' or @number == 'Q' or @number == 'K'
		return 10
	  elsif @number == 'A'
	  	return 1
	  else
		return @number.to_i
	  end
	end 
	
	def change_a
	  if @number === 'J' or @number == 'Q' or @number == 'K'
		return 10
	  elsif @number == 'A'
	  	return 11
	  else
		return @number.to_i
	  end
	end 
end