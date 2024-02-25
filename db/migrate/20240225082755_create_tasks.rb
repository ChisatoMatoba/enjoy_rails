class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string :task, null: false
      t.text :task_description, null: false

      t.timestamps
    end
  end
end
