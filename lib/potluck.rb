class Potluck

  attr_reader :date, :dishes
  def initialize(date)
    @date = date
    @dishes = []
  end

  def add_dish(dish)
    @dishes << dish
  end

  def get_all_from_category(category)
    @dishes.find_all do |dish|
      dish.category == category
    end
  end

  def menu
    categories = @dishes.map do |dish|
      dish.category
    end.uniq

    menu_hash = {}
    categories.each do |categ|
      category_str = categ.to_s + "s"
      dish_names = get_all_from_category(categ).map do |dish|
        dish.name
      end
      menu_hash[category_str.to_sym] = dish_names.sort!
    end

    menu_hash
  end

  def ratio(category)
    (get_all_from_category(category).length / dishes.length.to_f * 100).round(1)
  end
end
