class ChangeColumnTypeFromWines < ActiveRecord::Migration
  def change
    rename_column :wines, :type, :color
  end
end
