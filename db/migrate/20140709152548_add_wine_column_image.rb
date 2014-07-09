class AddWineColumnImage < ActiveRecord::Migration
  def change
    add_column :wines, :image, :text
  end
end
