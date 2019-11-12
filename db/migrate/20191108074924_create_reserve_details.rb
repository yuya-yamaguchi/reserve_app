class CreateReserveDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :reserve_details do |t|
      t.references :user, foreign_key: true, null: false
      t.references :studio, foreign_key: true, null: false
      t.date       :reserve_date, null: false
      t.integer    :start_time, null: false
      t.integer    :end_time, null: false
    end
  end
end
