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
		#if文で条件分岐する？手札に一がある場合とない場合。ない場合は元々の方で良い
		#汚いけどindexとselectで回るはず
		
		# 手札にAがあるかどうか判断するためのメソッド
		# 一つでもTrueがあったらTrueを返すメソッドの作成
		def card_check #モジュールのようにしても良い
			@hands.each do |hand|
				if hand.number.include?('A')
					return true
				end
				puts 'checkでここ通る'
				# return hand.number.include?('A')
				# return false
				# puts hand.number.include?('A')
			# 	puts hand.number
				# puts hand.number.include?('A')
			end
			puts 'ループ後ここ通る'
			return false
		end
		# puts card_check
		# puts card_check
		# puts @hands.number
		# puts @cards # 使えないnilが返ってくる
		# puts @hands.number cardsはこっちでは使うことができない
		# @cards.each do |card|
		# 	puts card.number
		# end
		puts card_check
		if card_check
			puts '1がある時ここ通ってる'
			@hands.each do |hand|
				score += hand.change
			end
			puts score
			# hand_checks = @hands.number.select { |n| n != 'A'}
			# puts hand_checks
			# hand_checks.each do |hand|
			# 	puts hand
			# 	score += hand.change
			# end
			# puts score
			#ここでは@handsには手札（文字列）、scoreには点数、hand_checksにはAを除いた配列が格納されている
			# Aが三枚、四枚の時に対応できていない？？
			if score + 10 > 21
				puts '21以上'
				score = 0
				@hands.each do |hand|
					score += hand.change
				end
				puts '21以上の処理'
				return score
			else
				score = 0
				puts '21以下'
				@hands.each do |hand|
					score += hand.change_a
					puts hand.show
					puts score
				end
				puts '21以下の処理'
				puts score
				return score
			end
		else
			@hands.each do |hand|
				score += hand.change_a
			end
			puts 'ここ通った'
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
	
	#16までは自動で手札を増やして、17からは引かない
	def dealer_hand
		if @dealer_hands <= 16
			dealer.draw
		else
			return 'ディーラーは17以上の手になりました。ここで引くのを終わります'
		end
	end
end