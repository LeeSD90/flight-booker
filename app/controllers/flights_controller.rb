class FlightsController < ApplicationController
  def index
  		@airports = Airport.all.map{ |a| a.IATA }
  		@dates = Flight.all.map { |f| f.start }
  end
end
