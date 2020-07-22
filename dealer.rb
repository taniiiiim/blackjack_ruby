# ディーラーを定義するファイル。プレイヤーから継承する。

require './player'

class Dealer < Player
  attr_accessor :hands, :score

  # 継承
  def initialize(hands = [], score = 0)
    super
  end

	# オーバーライド
	def draw_card(deck)
    # ディーラーはスコアが16を超えた場合ドローしない
    return if score > DEALER_LIMIT_SCORE
		card = deck.cards.pop
		hands.push(card)
    # ディーラーがドローしたカードはプレイヤーから見えない
    sleep(1)
	end

  # 継承
  def calculate_score
    super
	end

  # オーバーライド
  def judge
    if score > MAX_SCORE
      yellow_puts 'The dealer BUSTED!!!'
      sleep(1)
      cyan_puts 'You win!!!'
      sleep(2)
      exit
    elsif score == MAX_SCORE && hands.size == 2
      # 持ち札が二枚でスコアが21のときはブラックジャック
      yellow_puts 'Dealer BLACKJACK...'
      sleep(1)
      yellow_puts 'You lost...'
      sleep(2)
      exit
    elsif score > DEALER_LIMIT_SCORE
      # ディーラーはスコアが16を超えた場合ドローしない
      unless hands.size == 2
        yellow_puts 'The dealer stopped drawing.'
        sleep(1)
      end
    end
  end

  # オーバーライド
  def hit_or_stand(deck)
  	while score < DEALER_LIMIT_SCORE do
      # ディーラーはスコアが16を超えた場合ドローしない
  		sleep(1)
      draw_card(deck)
      calculate_score
      judge
  	end
    sleep(1)
  end
end
