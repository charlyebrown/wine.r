class AddPriceToWines < ActiveRecord::Migration
  def change
    add_column :wines, :price, :float
  end
end
