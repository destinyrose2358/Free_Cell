require_relative "cardspace.rb"

class Foundation < CardSpace

    def initialize
        super do |top_card, card|
            top_card_value = top_card ? top_card.freecell_value : 0
            top_card_suit = top_card ? top_card.suit : card.suit
            card.freecell_value - top_card_value == 1 && card.suit == top_card_suit
        end
    end

end