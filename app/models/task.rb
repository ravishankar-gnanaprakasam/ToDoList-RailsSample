class Task < ActiveRecord::Base
  attr_accessible :content, :status, :target_dt

  belongs_to :user

  # validates with dd/mm/yyyy
  DATE_VALID_REGX = /(0[1-9]|[12][0-9]|3[01])[\/.](0[1-9]|1[012])[\/.](19|20)\d\d/

  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validates :status, presence: true
  validates :target_dt, presence: true, format: { with: DATE_VALID_REGX }

  default_scope order: 'tasks.updated_at DESC'

  #before_update { |task| check_status_change(task) }
  after_update :trigger_mail


  private 

  	# def check_status_change(task)
  	# 	@status_check = false
  	# 	mtask = Task.find_by_id(task.id)
  	# 	if(task.status != mtask.status)
  	# 		@status_check = true
  	# 	else
  	# 		@status_check = false
  	# 	end
   #    temp = "Ravi"
  	# end

  	def trigger_mail
  		if !self.changes[:status].nil? && self.changes[:status][1] == AppConstants::CLOSED_STATUS_VALUE
  			# NotificationMailer.notify_email(user).deliver
        MailWorker.perform_async(user.name, self.content)
  		end
  	end

end
