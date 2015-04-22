class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.references :subject, index: true
      t.string :name
      t.integer :length
      t.string :description
      t.text :content

      t.timestamps null: false
    end
    add_foreign_key :tasks, :subjects
  end
end
