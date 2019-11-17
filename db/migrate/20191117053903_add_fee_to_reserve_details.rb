class AddFeeToReserveDetails < ActiveRecord::Migration[5.2]
  def change
    add_column :reserve_details, :payment_fee, :integer, null: false
  end
end
