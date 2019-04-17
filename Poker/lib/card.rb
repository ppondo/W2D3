class Card
    attr_reader :suit, :value
    SUITS = ["spade", "club", "diamond", "heart"].freeze

    def initialize(suit, value)
        @suit = suit
        @value = value
    end

    def self.suits
        SUITS
    end
end