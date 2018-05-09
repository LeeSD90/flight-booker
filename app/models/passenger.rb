class Passenger < ApplicationRecord
	has_many	:bookings
	has_many	:flights

	validates :name,  presence: true
	validates :email, presence: true,
	                  format:   { with: /[a-zA-Z]\w*@\w+\.\w{2,4}/ }
end
