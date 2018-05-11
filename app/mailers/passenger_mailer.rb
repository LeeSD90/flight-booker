class PassengerMailer < ApplicationMailer
    default from: 'text@example.com'

    def confirmation_email
        @user = params[:user]
        @url = 'http://example.com/login'
        mail(to: @user.email, subject: 'Booking Confirmation')
    end

end
