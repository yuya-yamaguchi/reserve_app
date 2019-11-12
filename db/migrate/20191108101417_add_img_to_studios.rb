class AddImgToStudios < ActiveRecord::Migration[5.2]
  def change
    add_column :studios, :img, :string
  end
end
