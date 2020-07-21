require './card'
require './deck'
require './player'
	
	def start_game
		#プレーヤーとディーラーの手札の初期化
		# puts 'それでは試合を開始します'
		player = Player.new
		# puts @hands
		dealer = Dealer.new
		
		# puts 'まずは山札を初期化します'
		#デッキの作成
		deck = Deck.new
		# puts deck
		deck.shuffle

		#プレーヤーに二枚、ディーラーに二枚配る
		# puts "現在の山札を表示する#{@hands}" #何も表示されない
		2.times do
			# puts 'ここは来ている'
			# puts deck
			player.draw(deck, player)
		end
		puts "あなたの現在の得点:#{player.score_count}"
		2.times do 
			# puts 'こっちは？'
			dealer.draw(deck, dealer)
		end
		puts "ディーラーの現在の得点は#{dealer.score_count}"
		# puts "\nディーラーの現在の得点：#{dealer.score_count}"
		#ここまででプレーヤーとディーラーの手札が表示されている
		#プレーヤーが手札を引くか引かないかを選択
		#プレーヤーのターンとして考える
		while true do
		puts 'hitするならyを、standするならnを入力してください'
			case gets.chomp
				when 'yes', 'YES', 'y', 'Y'
				player.draw(deck, player)
				# puts player.score_count
				# @hands.inject(:+)
				#手札を表示したいけどどうすればいいの？
				# puts "あなたの手札は現在#{@hands}です"
				puts "現在の得点は:#{player.score_count}"
					if player.score_count > 21
						puts 'bust!!!残念...あなたの負けです'
						exit
					elsif player.score_count == 21
						puts 'NICE!! BLACKJACK!!!!'
						break
					end
					
				when 'no', 'NO', 'n', 'N'
					break
				
			end
		end
		
		#次はディーラーのターン
		puts 'ディーラーのターンが始まります'
		loop do
			#if文で分岐の条件を作成
			# de_deck = @dealer_hands.inject(:+)
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
