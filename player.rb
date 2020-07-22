require './deck'

class Player
	#手札に箱を作る
	def initialize
		@hands = []
	end
	
	#一枚一枚取得して、@handsの配列に格納していく
	def draw(deck, player)
		card = deck.draw_card
		@hands.push(card)
	puts "あなたが引いたカードは#{card.show}です"
	end
	
	#現在の得点の計算
	def score_count
		score = 0
			def card_check #モジュールのようにしても良い
				@hands.each do |hand|
					if hand.number.include?('A')
						return true
					end
					
				end
				
				return false
			end
		if card_check
			@hands.each do |hand|
				score += hand.change
			end
			if score + 10 > 21
				score = 0
				@hands.each do |hand|
					score += hand.change
				end
				return score
			else
				score = 0
				@hands.each do |hand|
					score += hand.change_a
				end
				return score
			end
		else
			@hands.each do |hand|
				score += hand.change_a
			end
			return score
		end
	end
end



class Dealer
	def initialize
		@dealer_hands = []
	end
	#手札をひく
	def draw(deck, dealer)
		card = deck.draw_card
		@dealer_hands.push(card)
	end
	#スコアの計算
	def score_count
		score = 0
		@dealer_hands.each do |dealhand|
			score += dealhand.change
		end
		return score
	end
	def score_first
		return @dealer_hands[0].change
	end
	
	#16までは自動で手札を増やして、17からは引かない
	def dealer_hand
		if @dealer_hands <= 16
			dealer.draw
		else
			return 'ディーラーは17以上の手になりました。ここで引くのを終わります'
		end
	end
end