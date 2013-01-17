class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.string :password_salt
      t.string :password_hash
      t.integer :account_id

      t.timestamps
    end
  end
end
