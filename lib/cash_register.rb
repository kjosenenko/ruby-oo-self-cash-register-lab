require "pry"

class CashRegister

    attr_accessor :total, :discount, :last_item
    attr_reader :items

    def initialize(discount=0)
        @items = []
        @total = 0
        @discount = discount
        apply_discount
    end

    def add_item(title, price, quantity=1)
        @last_item = [title, price, quantity]
        self.total += (quantity * price)
        while quantity > 0
            @items << title
            quantity = quantity - 1
        end
    end

    def apply_discount
        if @discount > 0
            @total = @total - (@total * (@discount / 100.0))
            "After the discount, the total comes to $#{@total.truncate(0)}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        @total = @total - (@last_item[1] * @last_item[2])
    end

end
