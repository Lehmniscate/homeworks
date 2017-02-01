require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

INGREDIENTS = [
  "flour",
  "milk",
  "eggs",
  "sugar",
  "water",
  "salt",
  "baking powder",
  "vanilla",
  "chocolate"
]

describe Dessert do
  subject(:dessert) { Dessert.new("cake", 8, chef) }
  let(:chef) { double("chef", :titleize => "Chef") }
  let(:fresh) { Dessert.new("sugar", 8, chef)}

  before(:each) do
    INGREDIENTS.each do |ingredient|
      dessert.add_ingredient ingredient
    end
  end

  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq("cake")
    end

    it "sets a quantity" do
      expect(dessert.quantity).to eq(8)
    end

    it "starts ingredients as an empty array" do
      expect(fresh.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect{Dessert.new("a", "3", chef)}.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      dessert.add_ingredient("wafers")
      expect(dessert.ingredients).to include("wafers")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      dessert.mix!
      expect(dessert.ingredients).to_not eq(INGREDIENTS)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      dessert.eat(4)
      expect(dessert.quantity).to eq(4)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect {dessert.eat(12)}.to raise_error
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      expect(dessert.serve).to include("Chef")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(dessert)
      dessert.make_more
    end
  end
end
