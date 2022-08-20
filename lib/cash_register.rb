require 'pry'

class CashRegister 
    attr_accessor :total, :discount, :previous_total, :title

    def initialize (discount = 0)  
        @total = 0
        @previous_total = 0
        @discount = discount
        @title = []
    end  

    def add_item (title, price, quantity = 1)
        self.total += (price * quantity)
        self.previous_total = self.total - (price * quantity)
        if quantity == 1
            @title.push(title)
        elsif quantity > 1
            items = ("#{title} " * quantity).split(" ")
            items.each {|item| @title.push(item)}
        end
    end 

    def apply_discount 
        if self.discount > 0 
            self.total = self.total - (self.total * (discount.to_f / 100.0))
            return "After the discount, the total comes to $#{self.total.to_i}."
        else
            return "There is no discount to apply."
        end
    end

    def items
        @title
    end

    def void_last_transaction 
        if self.title.length > 0
            self.total = self.previous_total
        else
            self.total = 0
        end
    end
end