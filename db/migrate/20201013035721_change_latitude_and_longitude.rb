class ChangeLatitudeAndLongitude < ActiveRecord::Migration[5.1]
  def change
    change_column :reports, :latitude, 'double precision USING CAST(latitude AS double precision)'
    change_column :reports, :longitude, 'double precision USING CAST(longitude AS double precision)'
  end
end
