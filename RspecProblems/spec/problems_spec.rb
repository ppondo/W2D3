require "rspec"
require "problems"

describe "Array methods" do
    describe "#my_uniq" do
        let(:array){[1, 2, 1, 3, 3]}
        it "remove dups in array" do
            expect(array.my_uniq).to eq([1,2,3])
        end

        it "does not use built-in #uniq"do
            expect(array.my_uniq).not_to receive(:uniq)
        end

    end

    describe "#two sum" do
        let(:array){[-1, 0, 2, -2, 1]}
        it "returns an array of positions of pairs who equal zero" do
            expect(array.two_sum).to eq([[0, 4], [2, 3]])
        end



        it "returns smaller index before bigger index" do
            expect(array.two_sum).to eq(array.two_sum.map(&:sort))
        end

    end

    describe "#my_transpose" do
        let(:array){[[0, 1, 2],[3, 4, 5],[6, 7, 8]]}
        it "returns a 2d array" do
            expect(array.my_transpose[0]).to be_a(Array)
        end

        it "does not use built-in #transpose"do
            expect(array.my_transpose).not_to receive(:transpose)
        end

        it "returns a transposed array" do
            expect(array.my_transpose).to eq(array.transpose)
        end
    end

end

describe "Stock Picker" do
    let(:days){[1,0,5,6,2,0]}
    it "Finds the greatest profit" do
        greatest_pair = stock_picker(days)
        expect(days[greatest_pair[1]] - days[greatest_pair[0]]).to eq(6)
    end

    it "Does not sell before buying" do
        greatest_pair = stock_picker(days)
        expect(greatest_pair[0]).to be < greatest_pair[1]
    end

    it "Returns an array of elements with the greatest profit" do
        expect(stock_picker(days)).to eq([1,3])
    end
end

describe "Tower of Hanoi" do
    subject(:tower){Tower.new(3)}
    describe "#move" do        
        it "moves a disc from one pile to another" do
            tower.move(tower.pile_1, tower.pile_3)
            expect(tower.pile_3.length).to eq(1) 
        end

        it "raises an error if the disc is larger than the top disc of where it tries to move" do
            tower.move(tower.pile_1, tower.pile_3)
            expect{tower.move(tower.pile_1, tower.pile_3)}.to raise_error("You can't move a disc on a larger disc")
        end

        it "raises an error if the user tries to move an empty pile" do
            expect{tower.move(tower.pile_2, tower.pile_3)}.to raise_error("You can't move an empty pile")
        end
    end

    describe "#won" do
        it "determines when the game is won" do
            tower.cheat
            tower.won?
            expect(tower.game_won).to eq(true)
        end

        it "does not check if the first pile is considered a win" do
            tower.won?
            expect(tower.game_won).to eq(false)
        end

    end

end