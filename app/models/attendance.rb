class Attendance < ApplicationRecord
	belongs_to :user_attendee, class_name: "User"
	belongs_to :event_attended, class_name: "Event"

	after_create :event_registration

	def event_registration
		AttendanceMailer.event_registration(self.event_attended.user_host).deliver_now
	end

end