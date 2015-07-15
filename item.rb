class Item
  attr_accessor :name, :price

  def initialize(name, price)
    @name = name
    @price = Float(price)
  end

  def to_s
    "#{@name}: $#{price}"
  end
end