class User < ApplicationRecord
  has_many :procturing_events
  has_many :submissions
end
