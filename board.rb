require_relative "deck.rb"

class Board


    def initialize
        @deck = Deck.new
        @cells = Array.new(4)
        @foundations = Array.new(4)
        
    end
end