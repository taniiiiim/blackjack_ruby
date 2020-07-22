require './card'
require './deck'
require './player'
	
	def start_game
		player = Player.new
		dealer = Dealer.new
		deck = Deck.new
		deck.shuffle
		
		2.times do
			player.draw(deck, player)
		end
		puts "あなたの現在の得点:#{player.score_count}"
		2.times do
			dealer.draw(deck, dealer)
		end
		puts "ディーラーの現在の得点は#{dealer.score_count}"
		if player.score_count == 21
			puts 'NICE!!!!BLACKJACK!!!!!'
			exit
		end
		if dealer.score_count == 21
			puts 'dealer BLACKJACK'
			puts 'あなたの負けです'
			exit
		end
		
		while true do
		puts 'hitするならyを、standするならnを入力してください'
			case gets.chomp
				when 'yes', 'YES', 'y', 'Y'
				player.draw(deck, player)
				puts "現在の得点は:#{player.score_count}"
					if player.score_count > 21
						puts 'bust!!!残念...あなたの負けです'
						exit
					elsif player.score_count == 21
						puts '21なのでこれ以上引きません！'
						break
					end
					
				when 'no', 'NO', 'n', 'N'
					break
				
			end
		end
		
		#次はディーラーのターン
		puts 'ディーラーのターンが始まります'
		loop do
			puts dealer.score_count
			if dealer.score_count > 21
				puts 'dealer BUST!!!'
				puts 'あなたの勝利です'
				exit
			elsif dealer.score_count > 16
				puts 'ディーラーはこれ以上引きません'
				break
			end
			dealer.draw(deck, dealer)
		end
		fight(player, dealer)
		
	end
	
		#どちらもバストしなかった場合ここで勝負することに
	def fight(player, dealer)
		puts "あなたの得点:#{player.score_count}"
		puts "ディーラーの得点:#{dealer.score_count}"
		
		
		
		if player.score_count > dealer.score_count
			puts 'あなたの勝利です'
		elsif player.score_count == dealer.score_count
			puts 'この勝負はpushとなります'
		elsif player.score_count < dealer.score_count
			puts 'この勝負はディーラーの勝利です'
		end
	end
puts 'BlackJackを開始します'
start_game
