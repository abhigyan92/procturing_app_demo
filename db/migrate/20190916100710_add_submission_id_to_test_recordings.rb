class AddSubmissionIdToTestRecordings < ActiveRecord::Migration[5.1]
  def change
    add_reference :test_recordings, :submission, foreign_key: true
  end
end
