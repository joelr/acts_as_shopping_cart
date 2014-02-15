module ActiveRecord
  module Acts
    module ShoppingCart
      module Item

        #
        # Returns the cart item for the specified object
        #
        def item_for(object, size)
          shopping_cart_items.where(:item => object, :size => size).first
        end

        #
        # Returns the subtotal of a specified item by multiplying the quantity times
        # the price of the item.
        #
        def subtotal_for(object, size)
          item = item_for(object, size)
          item ? item.subtotal : 0
        end

        #
        # Returns the quantity of the specified object
        #
        def quantity_for(object, size)
          item = item_for(object, size)
          item ? item.quantity : 0
        end

        #
        # Updates the quantity of the specified object
        #
        def update_quantity_for(object, size, new_quantity)
          item = item_for(object, size)
          item.update_quantity(new_quantity) if item
        end

        #
        # Returns the price of the specified object
        #
        def price_for(object, size)
          item = item_for(object, size)
          item ? item.price : 0
        end

        #
        # Updates the price of the specified object
        #
        def update_price_for(object, size, new_price)
          item = item_for(object, size)
          item.update_price(new_price) if item
        end
      end
    end
  end
end
