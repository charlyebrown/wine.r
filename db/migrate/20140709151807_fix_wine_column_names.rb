class FixWineColumnNames < ActiveRecord::Migration
  def change
    rename_column :wines, :year, :vintage
    rename_column :wines, :grape_blend, :varietal
  end
end
