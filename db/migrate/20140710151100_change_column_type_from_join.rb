class ChangeColumnTypeFromJoin < ActiveRecord::Migration
  def change
    rename_column :users_wines, :users_id, :user_id
    rename_column :users_wines, :wines_id, :wine_id
  end
end
