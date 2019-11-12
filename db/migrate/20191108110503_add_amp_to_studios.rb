class AddAmpToStudios < ActiveRecord::Migration[5.2]
  def change
    add_column :studios, :guitar_amp, :string
    add_column :studios, :bass_amp, :string
    add_column :studios, :drums, :string
    add_column :studios, :keybords, :string
  end
end
