class MailWorker
	include Sidekiq::Worker
	sidekiq_options retry: false #By default it tries again and again


	def perform(user_name)
		NotificationMailer.notify_email(user_name).deliver
	end
end