class Deck
	
	def initialize
		@cards = []
	end
	#山札の作成
	def deck_made
		for type in ["スペード", "ダイヤ", "クローバー", "ハート"] do
			for number in ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"] do
				card = Card.new(type, number)
				@cards << card #一つ一つ破壊的に追加していく
			end
		end
	end
	#デッキの初期化 行けているかどうかの確認必要
	#シャッフルのところの定義を考える
	def shuffle
		@cards.shuffle!
		return @cards
	end
	
	def draw_card #popで山札から減らしていく
		@cards.pop
	end
	
	#デッキが10枚以下になったら初期化する
	
end