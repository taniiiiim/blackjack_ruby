# プレイヤーを定義するファイル

require './deck'

class Player
	attr_accessor :hands, :score

	def initialize(hands = [], score = 0)
		@hands = hands
		@score = score
	end

	# カードをドローするメソッド
	def draw_card(deck)
		card = deck.cards.pop
		hands.push(card)
	  cyan_puts "You drew #{card.show}."
		sleep(1)
	end

	# 手札の点数を計算するメソッド
	def calculate_score
		ace_conut = hands.select{ |hand| hand.number == ACE_NUMBER }.count
		self.score = hands.map{ |hand| hand.to_score }.inject(:+)
    if ace_conut > 0
			# もし手札にエースが存在する場合、全てのエースを1と置いて計算したスコアに足せるだけ10を足す
			while ace_conut > 0 && self.score + (ACE_VALUES[1] - ACE_VALUES[0]) <= MAX_SCORE
        self.score += (ACE_VALUES[1] - ACE_VALUES[0])
				ace_conut -= 1
			end
		end
	end

  # 現在のスコアから次のアクションを判定するメソッド
	def judge
		if score > MAX_SCORE
			cyan_puts 'You BUSTED!!!'
			sleep(1)
			yellow_puts 'Unfortunately, you lost...'
			sleep(2)
			exit
		elsif score == MAX_SCORE
			if hands.size == 2
				# 持ち札が二枚でスコアが21のときはブラックジャック
				cyan_puts 'NICE!!!!BLACKJACK!!!!!'
				sleep(1)
				cyan_puts 'You win!!!!'
				sleep(2)
				exit
			else
				# 持ち札が二枚でなくてもスコアが21のときは、もうカードは引かない
		  	cyan_puts 'Stopped drawing as Your score reached the max value!!!'
		  	sleep(2)
			end
		end
	end

  # hit/standの標準入力を受け付け、アクションを条件分岐させるメソッド
	def hit_or_stand(deck)
		while score < MAX_SCORE do
			# スコアが21を超えた場合に終了する
			cyan_puts 'Put y for hit, or n for stand.'
			case gets.chomp
				when 'yes', 'YES', 'y', 'Y'
					draw_card(deck)
					calculate_score
					puts ""
					cyan_puts "Your score is #{score}."
					sleep(2)
					judge
				when 'no', 'NO', 'n', 'N'
					break
			end
		end
	end
end
