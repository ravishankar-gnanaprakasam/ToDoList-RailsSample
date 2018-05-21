class NotificationMailer < ActionMailer::Base

  # default from: "ravishankar2kool@gmail.com"
  default from: MailConstants::FROM_MAIL

  def notify_email(user_name, content)
  	@user_name = user_name
  	@content = content
  	# mail(to: 'ravishankar.gnanaprakasam@freshworks.com', subject: 'Status Change')
  	mail(to: MailConstants::TO_MAIL, subject: MailConstants::STATUS_CHANGE_SUBJECT)
  end
end
