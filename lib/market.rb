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
end
