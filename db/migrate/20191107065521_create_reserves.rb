class CreateReserves < ActiveRecord::Migration[5.2]
  def change
    create_table :reserves do |t|
      t.references :studio, foreign_key: true, null: false
      t.date       :date, null: false
      t.integer    :hour, null: false
      t.integer    :reserve_flg, null: false
      t.timestamps
    end
  end
end
