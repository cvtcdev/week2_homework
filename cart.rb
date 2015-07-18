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
    ## Look at using reduce/inject
    ## 
    # @items.reduce(0) do |total, (item, quantity)|
    #  total += item.price * quantity
    # end
    total_amt = 0
    @items.each_pair do |item, quantity|
      total_amt += item.price * quantity
    end
    total_amt
  end

  ## attr_reader :items
  def items
    @items
  end
end
