require_relative "card.rb"

class Deck


    def self.full_deck
        cards = []
        Card.suits.each do |suit|
            Card.values.each do |value|
                cards << Card.new(suit, value)
            end
        end
        cards
    end

    def count
        cards.count
    end

    def empty?
        cards.empty?
    end

    def initialize(cards = Deck.full_deck)
        @cards = cards
    end

    def shuffle
        cards.shuffle!
        nil
    end

    def return(returned_cards)
        cards.concat(returned_cards)
        nil
    end

    def take(n)
        raise "Not enough cards" if n > count
        cards.shift(n)
    end

    private
    attr_accessor :cards
end