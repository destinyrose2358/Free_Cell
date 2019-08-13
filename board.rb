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

    def play

    end

    def reset

    end

    def get_input
        type = nil
        until type && available_types.include?(type)
            puts "What would you like to move from? ex:cell "
            type = gets.chomp
        end

        type_ref = type_to_ref(type)

        space = nil
        until space && type_ref[space]
            begin
                puts "which #{type} would you like?"
                space = Integer(gets.chomp)
                if type_ref[space].empty?
                    puts "That #{type} is empty"
                    space = nil
                end
            rescue
                puts "We need an integer, please"
                retry
            end
        end
    end

    def available_types
        types = []
        types << "cell" unless cells.empty?
        types << "cascade" unless cascades.all? { |cascade| cascade.empty? }
        types
    end

    def type_to_ref(type)
        return cells if type == "cell"
        return cascades if type == "cascade"
        return foundations if type == "foundation"
    end


    private
    attr_reader :cells, :foundations, :cascades, :deck

end

if __FILE__ == $PROGRAM_NAME
    board = Board.new
    board.render
end