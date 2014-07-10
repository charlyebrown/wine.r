class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :name
      t.string :address
      t.date   :birthday
      t.string :preferences
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
