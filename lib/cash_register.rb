require 'pry'

#I'm not sure when to use self vs. when to use the instance variable

class CashRegister
  attr_accessor :total, :discount, :title, :price, :recent_item_price, :items

  def initialize(discount = 0)
    self.total = 0
    self.discount = discount
    self.items = []
  end

  def add_item(title, price, quantity = 1)
    self.title = title
    self.price = price
    self.total += price * quantity

    quantity.times do 
      self.items << self.title
    end
    
    self.recent_item_price = price
  end

  def apply_discount
    if self.discount != 0
      #simpler way to do this?
      self.total = self.total - (self.total * self.discount / 100.0).to_i
      "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    self.total = self.total - self.recent_item_price
  end

end

