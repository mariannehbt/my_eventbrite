class User < ApplicationRecord
	has_many :attendances, foreign_key: 'user_attendee_id'
	has_many :events_attended, through: :attendance, source: :event_attended_id
	has_many :events_hosted, foreign_key: 'user_host_id', class_name: 'Event'

	after_create :welcome_send

	def welcome_send
		UserMailer.welcome_email(self).deliver_now
	end

end
