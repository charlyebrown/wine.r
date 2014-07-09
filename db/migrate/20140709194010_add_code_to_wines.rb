class AddCodeToWines < ActiveRecord::Migration
  def change
    add_column :wines, :code, :string
  end
end
