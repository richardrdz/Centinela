class CreateTypesReports < ActiveRecord::Migration[5.1]
  def change
    create_table :types_reports do |t|
      t.string :name, null: false
      t.string :img, null: false

      t.timestamps
    end
  end
end
