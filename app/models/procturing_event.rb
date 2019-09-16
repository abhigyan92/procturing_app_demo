class ProcturingEvent < ApplicationRecord
  belongs_to :user
  belongs_to :submission
end
