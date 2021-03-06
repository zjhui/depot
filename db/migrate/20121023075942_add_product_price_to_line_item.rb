class AddProductPriceToLineItem < ActiveRecord::Migration
#  def change
#    add_column :line_items, :price, :decimal
#  end
  def self.up
    add_column :line_items, :price, :decimal
    LineItem.all.each do |li|
      li.price = li.product.price
    end
  end

  def self.down
    remove_column :line_items, :price
  end
end
