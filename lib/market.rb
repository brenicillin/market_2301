class Market
  attr_reader :name,
              :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map {|vendor| vendor.name}
  end

  def vendors_that_sell(item)
    @vendors.select {|vendor| vendor.inventory.keys.include?(item)}
  end

  def sorted_item_list
    items = []
    @vendors.each do |vendor|
      vendor.inventory.each do |k, v|
        if v > 0
          items << k.name
        end
      end
    end
    items.uniq.sort
  end

  def check_stock(item)
    vendors_that_sell(item).reduce(0) do |total, vendor|
      total + vendor.check_stock(item)
    end
  end

  def total_inventory
    items_by_vendor.map do |item|
      inventory = {
        quantity: check_stock(item),
        vendors: vendors_that_sell(item)
      }
      [item, inventory]
    end.to_h
  end

  def items_by_vendor
    @vendors.map { |vendor| vendor.inventory.keys }.flatten.uniq
  end

  def overstocked_items
    items_by_vendor.select do |item|
      total_inventory[item][:quantity] > 50 && total_inventory[item][:vendors].count > 1
    end
  end

  def sell(item, amount)
    return false if total_inventory[item][:quantity] < amount
    vendors_that_sell(item).each do |vendor|
      if vendor.inventory[item] > amount
        vendor.inventory[item] -= amount
        break
      else
        amount -= vendor.inventory[item]
        vendor.inventory[item] = 0
      end
    end
  end
end
