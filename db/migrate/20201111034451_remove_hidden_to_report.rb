class RemoveHiddenToReport < ActiveRecord::Migration[5.1]
  def change
      remove_column :reports, :hidden
  end
end
