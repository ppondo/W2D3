class Array

    def my_uniq
        new_arr = []

        self.each do |ele|
            new_arr << ele unless new_arr.include?(ele)
        end

        return new_arr
    end

    def two_sum
        new_arr = []

        (0...self.length).each do |idx1|
            (idx1+1...self.length).each do |idx2|
                new_arr << [idx1, idx2] if self[idx1] + self[idx2] == 0
            end
        end

        return new_arr
    end

    def my_transpose
        new_arr = Array.new(self.length){Array.new(self.length)}

        (0...self.length).each do |idx1|
            (0...self.length).each do |idx2|
                new_arr[idx2][idx1] = self[idx1][idx2]
            end
        end

        return new_arr
    end

end

def stock_picker(arr)
    new_arr = [0, 0]
    largest_profit = 0


    (0...arr.length).each do |buy|
        (buy...arr.length).each do |sell|
            profit = arr[sell] - arr[buy]
            if profit > largest_profit
                largest_profit = profit 
                new_arr[0] = buy
                new_arr[1] = sell
            end
        end
    end
    return new_arr
end

###############################################################################

class Tower

    attr_accessor :pile_1, :pile_2, :pile_3, :game_won
    def initialize(n = 3)
        @pile_1 = []
        @pile_2 = []
        @pile_3 = []
        @size = n
        @game_won = false
        populate_pile(n, pile_1)
    end

    def play
        play_loop
    end

    

    def move(start_pile, end_pile)
        if !end_pile.empty? && start_pile.last.size > end_pile.last.size 
            raise "You can't move a disc on a larger disc"
        elsif start_pile.empty?
            raise "You can't move an empty pile"
        else
            end_pile << start_pile.pop
        end
    end

    def populate_pile(n, pile)
        return nil if n == 0
        pile << Disc.new(n)
        populate_pile(n-1, pile)
    end

    def won?
        @game_won = true if @pile_2.length == @size || @pile_3.length == @size
    end

    def cheat
        @pile_3 = @pile_1
        @pile_1 = @pile_2
    end

    def play_loop
        while game_won == false
            print @pile_1 
            print "\n"
            print @pile_2 
            print "\n"
            print @pile_3 
            print "\n"
            value_1 = prompt
            value_2 = prompt
            system("clear")
            move(value_1, value_2)
            won?
        end
    end

    def prompt
        print "Enter a tower like '1-3'"

        case gets.chomp
        when "1"
            return @pile_1
        when "2"
            return @pile_2
        when "3"
            return @pile_3
        end
    end

end

class Disc
    
    attr_reader :size
    def initialize(n)
        @size = n
    end
end



#  load "./lib/problems.rb"