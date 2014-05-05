class CreateJob < ActiveRecord::Migration
  def change
    enable_extension "uuid-ossp"

    create_table :jobs, id: :uuid do |t|
      t.string :title
      t.text   :body

      t.timestamps
    end
  end
end
