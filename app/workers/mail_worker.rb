class MailWorker
	include Sidekiq::Worker
	sidekiq_options retry: false #By default it tries again and again


	def perform(user_name, content)
		NotificationMailer.notify_email(user_name, content).deliver
	end
end