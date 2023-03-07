require './lib/item'
require './lib/vendor'

RSpec.describe Vendor do
  before(:each) do
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
    @vendor = Vendor.new('Rocky Mountain Fresh')
  end
  describe '#initialize' do
    it 'exists and has attributes' do
      expect(@vendor).to be_a(Vendor)
      expect(@vendor.name).to eq('Rocky Mountain Fresh')
      expect(@vendor.inventory).to eq({})
    end
  end
  describe '#check_stock' do
    it 'can check stock of certain items' do

      expect(@vendor.check_stock(@item1)).to eq(0)
    end

    it 'can add stock for certain item' do
      vendor.stock(@item1, 30)

      expect(@vendor.check_stock(@item1)).to eq(30)

      vendor.stock(@item1, 25)

      expect(@vendor.check_stock(@item1)).to eq(55)
    end
  end
end