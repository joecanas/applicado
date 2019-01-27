class CreateJobApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :job_applications do |t|
      t.integer :job_id
      t.integer :user_id
      t.text :message
      t.timestamps null: false
    end
  end
end
