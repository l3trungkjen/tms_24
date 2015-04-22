class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.references :user
      t.integer :target_id
      t.integer :activity_type

      t.timestamps null: false
    end
  end
end
