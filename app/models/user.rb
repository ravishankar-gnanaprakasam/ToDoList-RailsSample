class User < ActiveRecord::Base
  
  attr_accessible :email, :name, :password, :password_confirmation

  has_secure_password


  before_save { |user| user.email = email.downcase } #To ensure that email is saved to db in lower case
  before_save :create_remember_token

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, 
  				uniqueness: { case_sensitive: false }

  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true


  has_many :tasks, dependent: :destroy

  def open_items
    #Task.where("user_id = ? and status = ? and updated_at >= ?", id, "Open", Time.zone.now.beginning_of_day)
    Task.where("user_id = ? and status = ? and DATE(substr(target_dt,7,4)||'-'||substr(target_dt,4,2)
                ||'-'||substr(target_dt,1,2)) = ?", id, "Open", Date.today.to_s)
  end

  def closed_items
    #Task.where("user_id = ? and status = ? and updated_at >= ?", id, "Closed", Time.zone.now.beginning_of_day)
    Task.where("user_id = ? and status = ? and DATE(substr(target_dt,7,4)||'-'||substr(target_dt,4,2)
                ||'-'||substr(target_dt,1,2)) = ?", id, "Closed", Date.today.to_s)
  end



  private

	def create_remember_token
  		self.remember_token = SecureRandom.urlsafe_base64
	end

end