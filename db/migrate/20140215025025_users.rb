class Users < ActiveRecord::Migration
  def change
  	create_table :users do |t|
      t.string :username 
      t.string :email
      t.string :encrypted_password 
      t.string :salt
      t.string :avatar_url
      t.integer :highscore
      t.timestamps
  end
  end
end
