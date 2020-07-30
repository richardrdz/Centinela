class AddParams < ActiveRecord::Migration[5.1]
  def change
    add_column :reports, :image, :string, null: false
    add_column :reports, :latitude, :string, null: false
    add_column :reports, :longitude, :string, null: false
    add_column :reports, :hidden, :bool
  end
end
