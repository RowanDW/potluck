require './lib/dish'
require './lib/potluck'

RSpec.describe Potluck do
  context 'Initialize' do
    it 'exists' do
      potluck = Potluck.new("7-13-18")

      expect(potluck).to be_a(Potluck)
    end

    it 'has a date' do
      potluck = Potluck.new("7-13-18")

      expect(potluck.date).to eq("7-13-18")
    end

    it 'starts with no dishes' do
      potluck = Potluck.new("7-13-18")

      expect(potluck.dishes).to eq([])
    end
  end

  context 'Methods' do
    it 'adds dishes' do
      potluck = Potluck.new("7-13-18")
      couscous_salad = Dish.new("Couscous Salad", :appetizer)
      cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)

      potluck.add_dish(couscous_salad)

      expect(potluck.dishes).to eq([couscous_salad])

      potluck.add_dish(cocktail_meatballs)

      expect(potluck.dishes).to eq([couscous_salad, cocktail_meatballs])
    end

    it 'gets all the dishes in a category' do
      potluck = Potluck.new("7-13-18")
      couscous_salad = Dish.new("Couscous Salad", :appetizer)
      summer_pizza = Dish.new("Summer Pizza", :appetizer)
      cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
      roast_pork = Dish.new("Roast Pork", :entre)
      candy_salad = Dish.new("Candy Salad", :dessert)

      potluck.add_dish(couscous_salad)
      potluck.add_dish(summer_pizza)
      potluck.add_dish(roast_pork)
      potluck.add_dish(cocktail_meatballs)
      potluck.add_dish(candy_salad)

      expect(potluck.get_all_from_category(:appetizer)).to eq([couscous_salad, summer_pizza])
      expect(potluck.get_all_from_category(:entre)).to eq([roast_pork, cocktail_meatballs])
    end

    it 'creates a menu' do
      potluck = Potluck.new("7-13-18")
      couscous_salad = Dish.new("Couscous Salad", :appetizer)
      summer_pizza = Dish.new("Summer Pizza", :appetizer)
      cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
      roast_pork = Dish.new("Roast Pork", :entre)
      candy_salad = Dish.new("Candy Salad", :dessert)
      bean_dip = Dish.new("Bean Dip", :appetizer)

      potluck.add_dish(couscous_salad)
      potluck.add_dish(summer_pizza)
      potluck.add_dish(roast_pork)
      potluck.add_dish(cocktail_meatballs)
      potluck.add_dish(candy_salad)
      potluck.add_dish(bean_dip)

      expect(potluck.menu).to eq({:appetizers=>["Bean Dip", "Couscous Salad", "Summer Pizza"], :entres=>["Cocktail Meatballs", "Roast Pork"], :desserts=>["Candy Salad"]})
    end

    it 'calculates category ratios' do
      potluck = Potluck.new("7-13-18")
      couscous_salad = Dish.new("Couscous Salad", :appetizer)
      summer_pizza = Dish.new("Summer Pizza", :appetizer)
      cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
      roast_pork = Dish.new("Roast Pork", :entre)
      candy_salad = Dish.new("Candy Salad", :dessert)
      bean_dip = Dish.new("Bean Dip", :appetizer)

      potluck.add_dish(couscous_salad)
      potluck.add_dish(summer_pizza)
      potluck.add_dish(roast_pork)
      potluck.add_dish(cocktail_meatballs)
      potluck.add_dish(candy_salad)
      potluck.add_dish(bean_dip)

      expect(potluck.ratio(:appetizer)).to eq(50.0)
      expect(potluck.ratio(:entre)).to eq(33.3)
      expect(potluck.ratio(:dessert)).to eq(16.7)
    end
  end
end
