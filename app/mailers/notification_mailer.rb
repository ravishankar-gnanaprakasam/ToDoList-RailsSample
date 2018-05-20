class NotificationMailer < ActionMailer::Base

  # default from: "ravishankar2kool@gmail.com"
  default from: "ravi@development.com"

  def notify_email(user_name)
  	@user_name = user_name
  	# mail(to: 'ravishankar.gnanaprakasam@freshworks.com', subject: 'Status Change')
  	mail(to: 'ravishankar2kool@gmail.com', subject: 'Status Change')
  end
end
