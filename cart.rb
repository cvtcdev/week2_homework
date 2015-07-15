require_relative 'item.rb'

class Cart
  def initialize
    @items = {}
  end

  def add_item(item, quantity)
    if @items.include?(item)
      @items[item] += quantity
    else
      @items.merge!(item => quantity)
    end
  end

  def total
    total_amt = 0
    @items.each_pair do |item, quantity|
      total_amt += item.price * quantity
    end
    total_amt
  end

  def items
    @items
  end
end