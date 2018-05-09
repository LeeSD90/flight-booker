class BookingsController < ApplicationController

  def new
  	@flight = Flight.find(params[:flight_id])
  	@booking = Booking.new(flight_id: @flight.id)
  	params[:passengers].to_i.times { @booking.passengers.build }
  end

  def create
  	@booking = Booking.new(flight_id: booking_params[:flight_id])

  	booking_params[:passengers_attributes].each do |k, v|
  		@passenger = Passenger.find_by(email: v[:email])
  		if @passenger
  			@booking.passengers << @passenger
  		else
  			@booking.passengers.build(name: v[:name], email: v[:email])
  		end
  	end

  	if @booking.save
  		flash[:success] = "Booking successfully created"
  		redirect_to @booking
  	else
  		flash[:error].now = "Error! #{@booking.errors.messages}"
  		render 'new'
  	end
  end

  def show
  	@booking = Booking.find(params[:id])
  end

  private

  	def booking_params
  		params.require(:booking).permit(:flight_id, :passengers_attributes => [:id, :name, :email])
  	end

end
