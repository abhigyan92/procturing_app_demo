class Submission < ApplicationRecord
	belongs_to :user
	has_many :procturing_events
end
