require_relative "card.rb"

class CardSpace
    
    def initialize(&placement_condition)
        @cards = []
        @placement_condition = placement_condition
    end

    def empty?
        cards.empty?
    end

    def count
        cards.count
    end

    def place(card)
        raise "This is not allowed to go here" unless placement_condition.call(top_card, card)
        cards.push(card)
        nil
    end

    def place!(card)
        cards.push(card)
        nil
    end

    def to_s
        output = ""

        cards.each do |card|
            output += " " + card.to_s
        end

        output
    end

    private
    attr_reader :placement_condition
    attr_accessor :cards

    def top_card
        cards.last
    end

end