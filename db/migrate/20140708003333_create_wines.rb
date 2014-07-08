class CreateWines < ActiveRecord::Migration
  def change
    create_table :wines do |t|
      t.string   :name
      t.string   :grape_blend
      t.integer  :year
      t.string   :region
      t.string   :vineyard
      t.text     :description
      t.text     :flavor_profile
      t.string   :color
      t.integer  :rating

      t.timestamps

    end
  end
end
