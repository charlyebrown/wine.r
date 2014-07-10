class CreateUsersWinesJoinTable < ActiveRecord::Migration
  def change
    create_table :users_wines do |t|
      t.integer :users_id
      t.integer :wines_id
    end
  end
end
