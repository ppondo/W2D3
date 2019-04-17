require_relative 'card'

class Deck
    attr_accessor :cards

    def initialize
        @cards = []
    end

    def populate
        @cards = []

        Card.suits.each do |suit|
            (1..13).each do |num|
                @cards << Card.new(suit, num)
            end
        end
    end

    def shuffle
        @cards.shuffle
    end

    def draw 
        if @cards.length > 0
            @cards.pop
        else
            raise 'No cards left'
        end
    end
end