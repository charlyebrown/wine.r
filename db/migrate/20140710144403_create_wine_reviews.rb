class CreateWineReviews < ActiveRecord::Migration
  def change
    create_table :wine_reviews do |t|
      t.string       :title
      t.text         :content
      t.belongs_to   :user
      t.references   :wine
      t.integer      :rating
    end
  end
end
