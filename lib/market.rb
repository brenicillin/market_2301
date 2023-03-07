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

  def total_inventory
   hash = Hash.new([])
   hash2 = Hash.new(0)
   @vendors.each do |vendor|
    vendor.inventory.each do |item, amount|
      hash[item.name] = hash2
      hash2[:quantity] += amount
      hash2[:vendors] << vendo.name
      # hash[item.name][:vendors] << vendor
    end
  end
  require 'pry'; binding.pry
   hash
  end
end
