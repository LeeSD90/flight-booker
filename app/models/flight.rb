class Flight < ApplicationRecord
	belongs_to :from_airport, class_name: "Airport"
	belongs_to :to_airport, class_name: "Airport"
	has_many :bookings
	has_many	:passengers

	validates :from_airport_id, presence: true
	validates :to_airport_id, presence: true

	def self.get_flights(from, to, date)
		self.where(from_airport: from, to_airport: to, start: Date.parse(date).all_day)
	end

end
