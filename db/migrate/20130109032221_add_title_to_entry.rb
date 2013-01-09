class AddTitleToEntry < ActiveRecord::Migration
  def change
    change_table :entries do |t|
      t.text :title
    end
  end
end
