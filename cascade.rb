require_relative "cardspace.rb"

class Cascade < CardSpace

    def initialize
        super do |top_card, card|
            self.empty? || (top_card.freecell_value - card.freecell_value == 1 && card.color != top_card.color)
        end
    end

end