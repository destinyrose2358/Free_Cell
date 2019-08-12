require_relative "cardspace.rb"

class Cascade < CardSpace

    def initialize
        super do |top_card, card|
            self.empty? || (top_card.freecell_value - card.freecell_value == 1 && card.color != top_card.color)
        end
    end

    def transfer_to(other_space)
        raise "There is no card here" if top_card.nil?
        raise "#{top_card.to_s} cannot be transferred there" unless other_space.can_accept?(top_card)
        other_space.place(cards.pop)
        nil
    end

end