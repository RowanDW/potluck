require './lib/dish'

RSpec.describe Dish do
  context 'Initialize' do
    it 'exists' do
      dish = Dish.new("Couscous Salad", :appetizer)

      expect(dish).to be_a(Dish)
    end

    it 'has a name' do
      dish = Dish.new("Couscous Salad", :appetizer)

      expect(dish.name).to eq("Couscous Salad")
    end

    it 'has a category' do
      dish = Dish.new("Couscous Salad", :appetizer)

      expect(dish.category).to eq(:appetizer)
    end
  end

end
