require_relative "deck.rb"
require_relative "cells.rb"
require_relative "cascade.rb"
require_relative "foundation.rb"

class Board


    def initialize
        @deck = Deck.new
        @cells = Cells.new
        @foundations = Array.new(4) { Foundation.new }
        @cascades = Array.new(8) { Cascade.new }
        set_game
    end

    def set_game
        deck.shuffle
        until deck.empty?
            cascades.each do |cascade|
                card = deck.draw unless deck.empty?
                cascade.place(card) if card
            end
        end
    end

    def render
        system "clear"
        puts "Cells: " + cells.to_s
        puts "Foundations"
        foundations.each_with_index do |foundation, index|
            puts index.to_s + foundation.to_s
        end
        puts "Cascades"
        cascades.each_with_index do |cascade, index|
            puts index.to_s + cascade.to_s
        end
        nil
    end


    private
    attr_reader :cells, :foundations, :cascades, :deck

end

if __FILE__ == $PROGRAM_NAME
    board = Board.new
    board.render
end