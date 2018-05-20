require '/Users/ravishankarg/Documents/rails_workspace/todo_list/app/mailers/notification_mailer.rb'

namespace :scheduler do
	task trigger_email: :environment do
		NotificationMailer.notify_email('Ravi').deliver
	end	
end

# * * * * * bundle exec rake scheduler:trigger_email