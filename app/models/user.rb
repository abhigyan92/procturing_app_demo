class User < ApplicationRecord
  has_many :procturing_events

  has_many :test_recordings
  has_many :submissions
end
