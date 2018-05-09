class Flight < ApplicationRecord
	validates :from_airport_id, presence: true
	validates :to_airport_id, presence: true
end
