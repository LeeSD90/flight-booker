class FlightsController < ApplicationController
  def index
  		@airports = Airport.all.map{ |a| [a.IATA, a.id] }
  		@dates = Flight.all.map { |f| f.start.to_date }.uniq

  		@flights = []
  		@from_airport = params[:from_airport]
  		@to_airport = params[:to_airport]
  		@date = params[:date]
  		@passengers = params[:passengers]

  		check_flights if params[:commit]
  end

  private

  	def check_flights
  		if @to_airport != @from_airport
  			@flights = Flight.get_flights(params[:from_airport], params[:to_airport], params[:date])
  		else
  			flash.now[:danger] = "Departure airport and destination airport should not be the same!"
  		end
  	end
end
