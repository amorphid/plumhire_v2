class CreateApplication < ActiveRecord::Migration
  def change
    create_table :applications, id: :uuid do |t|
      t.string :email
      t.string :name
      t.string :resume_url
      t.uuid   :job_id

      t.timestamps
    end
  end
end
