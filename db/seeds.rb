Airport.delete_all
Airport.create(IATA: "LAX")
Airport.create(IATA: "SFO")
Airport.create(IATA: "NYC")
Airport.create(IATA: "DUB")
Airport.create(IATA: "KRS")

Flight.delete_all
airports = Airport.all

50.times do |i|
	from = airports[rand(0..4)]
	to = airports[rand(0..4)]
	while from == to
		to = airports[rand(0..4)]
	end
	Flight.create(from_airport_id: from.id, to_airport_id: to.id, start: Faker::Time.forward(30, :all), duration: rand(1..20))
end