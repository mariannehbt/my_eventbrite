class Event < ApplicationRecord
	has_many :attendances, foreign_key: 'event_attended_id'
	has_many :users_attendees, through: :attendance, source: :user_attended_id
	belongs_to :user_host, class_name: 'User'

	validates :start_date,
		presence: true
	validate :start_date_ok?

	validates :duration,
		presence: true
	validate :duration_modulo_5?

	validates :title,
		presence: true,
		length: {in: 5..140, message: 'Title must be between 5 and 140 characters long'}

	validates :description,
		presence: true,
		length: {in: 20..1000, message: 'Description must be between 20 and 1000 characters long'}

	validates :price,
		presence: true,
		numericality: { greater_than: 1, less_than: 1000, message: 'Price must be between 1$ and 1000$'}

	validates :location,
		presence: true

	def end_date
		return start_date + (duration * 60)
	end

	private

	def start_date_ok?
		errors.add(:start_date, "can't be in the past") unless
		start_date.present? && start_date > Date.today
	end

	def duration_modulo_5?
		errors.add(:duration, "must be positive and a multiple of 5") unless
		duration.to_i % 5 == 0 && duration.to_i > 0
	end

end