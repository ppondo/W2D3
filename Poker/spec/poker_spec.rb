require "card"
require "deck"
require "hand"
require "player"
require "game"
require "rspec"

describe "Poker Game" do
    describe "card" do 
        it "creates a card" do 
            expect(Card.new("clubs", 1)).to be_an_instance_of(Card) 
        end
    end

    describe "deck" do 
    let(:deck) { Deck.new }
        describe '#initialize' do
            it "creates a deck" do 
               expect(deck).to be_an_instance_of(Deck) 
            end
        end

        describe '#populate' do
            it 'populates the deck with 52 cards' do 
                deck.populate
                expect(deck.cards.length).to eq(52)
            end
        end

        describe 'shuffle' do
            it 'shuffles the deck correctly' do
                deck.populate
                deck.shuffle
                expect(deck.cards).not_to eq(Deck.new.populate)
            end
        end

        describe 'draw' do
            it 'should return a card' do
                deck.populate
                expect(deck.draw).to be_an_instance_of(Card)
            end

            it 'removes a card from the deck' do
                deck.populate
                deck.draw
                expect(deck.cards.length).to eq(51)
            end

            it 'raises an error if the deck is empty' do
                expect{ Deck.new.draw }.to raise_error('No cards left')
            end
        end
    end
end