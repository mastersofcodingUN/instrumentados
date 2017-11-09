class UserMailer < ApplicationMailer
  def notifier(user, enroll, course)
    @enroll = enroll
    @course = course
    mail(to: user.email,
    	 subject: "Delayed Job"     	 
    	)

  end
  
end