class Vendor
  attr_reader :name,
              :inventory
  
  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    @inventory[item]
  end

  def stock(item, amount)
    @inventory[item] += amount
  end

  def potential_revenue
    revenue = []
    @inventory.each do |item, amount|
      revenue << item.price * amount
    end
    revenue.sum
  end
end
