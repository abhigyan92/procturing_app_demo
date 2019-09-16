class TestRecording < ApplicationRecord
  belongs_to :user
  belongs_to :submission
  mount_uploader :video, VideoUploader
end
