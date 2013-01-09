class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.date :entered_on
      t.text :body
      t.integer :project_id

      t.timestamps
    end
  end
end
