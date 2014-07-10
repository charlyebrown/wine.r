class CreateWines < ActiveRecord::Migration
  def change
    create_table :wines do |t|
      t.string   :name
      t.string   :varietal
      t.integer  :vintage
      t.string   :region
      t.string   :vineyard
      t.text     :description
      t.string   :type
      t.integer  :rating
      t.text     :image
      t.string   :code

      t.timestamps

    end
  end
end
