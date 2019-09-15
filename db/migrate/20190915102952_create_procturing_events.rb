class CreateProcturingEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :procturing_events do |t|
      t.string :name
      t.text :description
      t.string :value
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
