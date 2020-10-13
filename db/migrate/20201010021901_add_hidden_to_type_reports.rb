class AddHiddenToTypeReports < ActiveRecord::Migration[5.1]
  def change
    add_column :types_reports, :hidden, :bool
  end
end
