class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.text :description
      t.string :priority
      t.integer :list_id
      t.text :name

      t.timestamps
    end
  end
end
