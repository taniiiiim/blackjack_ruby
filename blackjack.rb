require './card'
require './deck'
require './player'
require './dealer'

# ゲームを動かすメソッド
def process
	player = Player.new
	dealer = Dealer.new
	deck = Deck.new

	puts ""
	green_puts "Let\'s start BLACKJACK!!!"
	puts ""
	sleep(2)
	start_game(player, dealer, deck)

	puts ""
	cyan_puts "It\'s your turn."
	puts ""
	sleep(1)
	player.hit_or_stand(deck)

	puts ""
	green_puts "It\'s the dealer\'s turn."
	puts ""
	sleep(1)
	dealer.hit_or_stand(deck)

	puts ""
  green_puts "It's Battle Time!!!"
	puts ""
	sleep(2)
	battle(player, dealer)
end

# ゲーム開始時の処理を担当するメソッド
def start_game(player, dealer, deck)
	2.times do
		player.draw_card(deck)
		dealer.draw_card(deck)
	end

	player.calculate_score
	cyan_puts "Your score is #{player.score}."
	sleep(2)
	dealer.calculate_score
	yellow_puts "The dealer\'s first card is #{dealer.hands.first.show}."
	sleep(2)

	player.judge
	dealer.judge
end

# 最後の点数比べを担当するメソッド
def battle(player, dealer)
	cyan_puts "Your score is #{player.score}."
	sleep(2)
	yellow_puts "The dealer's score is #{dealer.score}."
	sleep(2)
	puts ""
	if player.score > dealer.score
		cyan_puts 'You win!!!!'
	elsif player.score == dealer.score
		green_puts 'Draw.'
	elsif player.score < dealer.score
		yellow_puts 'You Lost...'
	end
	sleep(2)
end

# 指定した色をつけて標準出力するメソッド
def colorful_puts(str, color = "\e[0m")
	print color
	puts str
	print "\e[0m"
end

# シアンをつけて標準出力するメソッド
def cyan_puts(str)
  colorful_puts(str, "\e[36m")
end

# 黄色をつけて標準出力するメソッド
def yellow_puts(str)
  colorful_puts(str, "\e[33m")
end

# 緑色をつけて標準出力するメソッド
def green_puts(str)
	colorful_puts(str, "\e[32m")
end

process
