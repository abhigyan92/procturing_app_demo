class Submission < ApplicationRecord
	belongs_to :user
	has_many :procturing_events
	has_many :test_recordings

	before_create :init

	def init
		status = "started"
	end

end
