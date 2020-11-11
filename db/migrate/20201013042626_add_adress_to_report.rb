class AddAdressToReport < ActiveRecord::Migration[5.1]
  def change
    add_column :reports, :address, :text
  end
end
