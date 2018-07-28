class AddAmountToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :amount, :float, null: false, default: 0.0
  end
end
