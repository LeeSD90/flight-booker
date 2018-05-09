class Flight < ApplicationRecord
	belongs_to :from_airport, class_name: "Airport"
	belongs_to :to_airport, class_name: "Airport"

	validates :from_airport_id, presence: true
	validates :to_airport_id, presence: true
end