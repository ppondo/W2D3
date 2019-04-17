require_relative 'card'

class Hand 
   attr_accessor :hand
   attr_reader :hand_value

    def initialize 
        @hand = []
        #hand_value = [hand strength, flush strength, value strength]
        @hand_value = [1, 0, 0]
    end

    def is_flush?
        if @hand.all? { |card| card.suit == @hand.first.suit }
            @hand_value[0] = 6
            return true
        else
            return false
        end
    end

    def is_straight?
        values = []

        @hand.each do |card|
            values << card.value
        end

        values = values.sort

        (0..3).each do |i|
            return false unless values[i] + 1 == values[i+1]
        end
        
        @hand_value[0] = 5
        true
    end

    def is_n_kind?(n)
        
        @hand.each do |card1|
            counter = 0
            test_check = card1.value
            @hand.each do |card2|
                counter += 1 if test_check == card2.value
            end

            if n == 4 && counter == n
                @hand_value[0] = 8 
                return true
            elsif n == 3 && counter == n
                @hand_value[0] = 4
                return true
            elsif n == 2 && counter == n
                @hand_value[0] = 2
                return true
            end
        end

        false
    end

    def is_two_pair?
        temp = Hash.new { |h,k| h[k] = [] }
        pair1 = false
        pair2 = false

        @hand.each do |card|
            temp[card.value] << card
        end

        temp.each do |_, v|
            pair1 = true if v.length == 2
            pair2 = true if v.length == 2 && pair1        
        end
        
        
        if pair2 && pair1 
            @hand_value[0] = 3
            true 
        else 
            false
        end
    end

    def is_full_house?
        temp = Hash.new { |h,k| h[k] = [] }
        pair = false
        triples = false

        @hand.each do |card|
            temp[card.value] << card
        end

        temp.each do |_, v|
            pair = true if v.length == 2
            triples = true if v.length == 3        
        end
        
        
        if pair && triples
            @hand_value[0] = 7
            true 
        else
            false
        end
    end

    def is_straight_flush?
        
        if is_straight? && is_flush? 
            @hand_value[0] = 9
            true
        else
            false
        end
    end

    def ==(other_hand)
        if self.hand_value[0] > other_hand.hand_value[0]
            print "I have a stronger hand"
        elsif self.hand_value[0] == other_hand.hand_value[0]
            print "We have the same type of hand"
        else
            print "Your hand is stronger"
        end
    end

end

#load './lib/hand.rb'