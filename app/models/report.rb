class Report < ApplicationRecord
  belongs_to :types_report
  belongs_to :user
  geocoded_by :address
  reverse_geocoded_by :latitude, :longitude
  after_validation :geocode, :reverse_geocode
end
