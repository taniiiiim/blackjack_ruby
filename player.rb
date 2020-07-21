require './deck'

class Player
	#手札に箱を作る
	def initialize
		@hands = []
	end
	
	#一枚一枚取得して、@takeの配列に格納していく
	def draw(deck, player)
		# puts deck
		# puts 'ここまで来ているか'
		# puts "#{deck}"
		# card = deck.draw_card
		# puts "#{deck}"
		# puts deck.draw_card
		card = deck.draw_card
		# puts card
		@hands.push(card)
		# puts "#{card}"
		# puts "#{@hands}"
	puts "あなたが引いたカードは#{card.show}です"
	# puts "------------あなたの現在の手札---------------"
	# 	@hands.each_with_index do |hand, i|
	# 		puts "あなたの手札:#{i + 1}枚目#{hand.show}"
	# end
	# puts "---------------------------------------------"
		
	end
	
	#現在の得点の計算
	def score_count
		score = 0
		@hands.each do |hand|
			score += hand.change
		end
		return score
	end
end



class Dealer
	def initialize
		@dealer_hands = []
	end
	#手札をひく
	def draw(deck, dealer)
		# puts deck
		# puts 'ディーラー側'
		card = deck.draw_card
		# puts "#{card}"
		@dealer_hands.push(card)
		# puts @dealer_hands
		# puts "\nディーラーが引いたカードは#{@dealer_hands[0].show}です"
		# puts "------------ディーラーの現在の手札---------------"
		# puts "#{@dealer_hands[0].show}"
		# puts "二枚目は伏せておきます"
		# puts "--------------------------------------"
	end
	#スコアの計算
	def score_count
		score = 0
		@dealer_hands.each do |dealhand|
			score += dealhand.change
		end
		return score
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