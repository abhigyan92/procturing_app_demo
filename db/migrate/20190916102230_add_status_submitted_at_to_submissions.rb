class AddStatusSubmittedAtToSubmissions < ActiveRecord::Migration[5.1]
  def change
    add_column :submissions, :status, :string
    add_column :submissions, :submitted_at, :datetime
  end
end
