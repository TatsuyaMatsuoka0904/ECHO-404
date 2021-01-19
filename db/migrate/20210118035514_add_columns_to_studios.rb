class AddColumnsToStudios < ActiveRecord::Migration[5.2]
  def change
    add_column :studios, :address, :string
    add_column :studios, :latitude, :float
    add_column :studios, :longitude, :float
  end
end
