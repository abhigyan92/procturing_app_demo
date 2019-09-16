class CreateTestRecordings < ActiveRecord::Migration[5.1]
  def change
    create_table :test_recordings do |t|
      t.string :video
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
