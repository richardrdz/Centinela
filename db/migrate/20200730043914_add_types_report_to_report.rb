class AddTypesReportToReport < ActiveRecord::Migration[5.1]
  def change
    add_reference :reports, :types_report, foreign_key: true
  end
end
