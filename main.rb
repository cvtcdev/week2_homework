require_relative 'item.rb'
require_relative 'cart.rb'

def print_items(items)
  item_number = 1

  items.each do |item|
    print "#{item_number}. "
    puts item
    item_number += 1
  end

end

def print_summary(my_cart)
  puts "\nTotal items:\n\n"

  my_cart.items.each_pair do |item, quantity|
    print item
    puts " x #{quantity} = $%.2f" % (item.price * quantity)
  end

  puts "\nTotal: $%.2f" % my_cart.total
end

def main
  response = 'y'
  item1 = Item.new('Aerosmith - Toys in the Attic', 15.99)
  item2 = Item.new('The Beatles - Abbey Road', 21.99)
  item3 = Item.new('The Clash - London Calling', 18.99)
  item4 = Item.new('Frank Zappa - One Size Fits All', 16.99)
  item5 = Item.new('Pink Floyd - Dark Side of the Moon', 17.99)
  items = [item1, item2, item3, item4, item5]
  my_cart = Cart.new

  puts "Hello and Welcome to 'Vintage Vinyl'"
  puts "We have the a large selection of LPs available."

  while response == 'y'
    puts 'Would you like to add an item to your cart?(y/n)'
    response = gets.chop
    if response == 'y'
      puts "Here is a list of items for sale today:"
      print_items(items)
      puts 'Please enter item number (1-5): '
      item_number_chosen = gets.chop.to_i - 1

      if item_number_chosen < 0 || item_number_chosen > 4
        puts 'That item does not exist. Please try again'
        redo
      end

      item_chosen = items[item_number_chosen]
      puts "How many of '#{item_chosen.name}' would you like to add to your cart?"
      item_quantity = gets.chop.to_i

      if item_quantity < 1
        puts "Please enter positive quantities only. Try again."
        redo
      end

      my_cart.add_item(item_chosen, item_quantity)
    end
  end

  print_summary(my_cart)
end

main