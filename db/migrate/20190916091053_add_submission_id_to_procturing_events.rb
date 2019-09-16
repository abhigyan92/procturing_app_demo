class AddSubmissionIdToProcturingEvents < ActiveRecord::Migration[5.1]
  def change
    add_reference :procturing_events, :submission, foreign_key: true
  end
end
