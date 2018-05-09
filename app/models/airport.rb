class Airport < ApplicationRecord
	validates :IATA, length: { is: 3 }, presence: true
end
