class Notification < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification.room_added.subject
  #
  def room_added(room)
  	@room= room
    mail to: "#{room.user.email}",subject:"Your room has been confirmed"

  end
  def confirmmailguest(gmail)
  	@gmail =gmail
  	mail to: "#{@gmail.user.email}",subject:"Booked successfully"
  end
  def confirmmailhost(mail)
    @mail =mail 
    mail to: "#{mail.room.user.email}",subject: "Confirm the booking"
  end 
  def confirmroom(rmail)
    @rmail = rmail
    mail to: "#{@rmail.user.email}", subject: "Room confirmed"
  end
end
     