# デッキを定義するファイル

require './card'
require './constants'
require './error'

class Deck
	attr_accessor :cards

  # 52枚のカードを使うことが前提なので、デフォルト引数にdeck_cardsを置いてしまう。
	def initialize(cards = self.deck_cards)
    begin
			raise InvalidCardError if cards.any?{ |card| card.class != Card }
			raise OverLimitCardError if cards.size > MAX_CARDS
  		@cards = cards
	  rescue => error
			error.log
		end
	end

	# 山札を作成するメソッド
	def deck_cards
		deck_cards = []
		CARD_TYPES.each do |type|
			CARD_NUMBERS.each do |number|
				deck_cards << Card.new(type, number)
			end
		end
		deck_cards.shuffle!
	end
end
