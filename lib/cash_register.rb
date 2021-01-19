class Item

  attr_reader :name, :cost, :quantity

  def initialize(name, cost, quantity)
    @name = name
    @cost = cost
    @quantity = quantity
  end

end

class CashRegister

  attr_reader :total

  def initialize (discount = 0)
    @total = 0.0
    @discount = discount
    @item_list = []
  end

  def calculate_total
    new_total = 0.0
    @item_list.each do |item|
      new_total += item.cost * item.quantity
    end
    @total = new_total
  end

  def add_item(item, cost, quantity = 1)
    new_item = Item.new(item, cost, quantity)
    @item_list << new_item
    self.calculate_total
  end

  def apply_discount
    if @discount == 0
      return "There is no discount to apply."
    else
      @total -= (@total/100) * @discount
      return "After the discount, the total comes to ${@total}."
    end
  end

  def items
    item_names = []
    @item_list.each do |item|
      item.quantity.times {
        item_names << item.name
      }
    end
    return item_names
  end

  def void_last_transaction
    @item_list.pop
    self.calculate_total
  end

end

# class CashRegister
#
#   attr_accessor :total, :discount, :last_added_cost
#
#   def initialize (discount = 0)
#     @total = 0
#     @discount = discount
#     @item_list = []
#     @last_added_cost = 0
#   end
#
#   def total
#     @total
#   end
#
#   def add_item(item, cost, quantity = 1)
#     quantity.times {@item_list << item}
#     @total = @total + (cost*quantity)
#     @last_added_cost = cost*quantity #as this is overwritten with every new item, this will store correctly
#   end
#
#   def apply_discount
#     if @discount > 0
#       actual_discount = @total/100 * @discount
#       @total = @total - actual_discount
#       return "After the discount, the total comes to $#{@total}."
#     else
#       return "There is no discount to apply."
#     end
#   end
#
#   def items
#     return @item_list
#   end
#
#   def void_last_transaction
#     @total = @total - @last_added_cost
#   end
#
# end
