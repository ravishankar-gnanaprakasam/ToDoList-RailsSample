module AppConstants
	OPEN_ITEMS_QUERY = "user_id = ? and status = ? and DATE(substr(target_dt,7,4)||'-'||substr(target_dt,4,2)||'-'||substr(target_dt,1,2)) = ?".freeze
	CLOSED_ITEMS_QUERY = "user_id = ? and status = ? and DATE(substr(target_dt,7,4)||'-'||substr(target_dt,4,2)||'-'||substr(target_dt,1,2)) = ?".freeze
	OPEN_STATUS_VALUE = "Open".freeze
	CLOSED_STATUS_VALUE = "Closed".freeze
end

module MailConstants
	FROM_MAIL = 'ravishankar@dev.com'.freeze
	TO_MAIL = 'ravishankar2kool@gmail.com'.freeze
	STATUS_CHANGE_SUBJECT = 'Task Closed'.freeze
end