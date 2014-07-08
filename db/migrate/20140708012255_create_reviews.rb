class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string       :title
      t.text         :content
      t.belongs_to   :user
      t.references   :wine
      t.integer      :rating
    end
  end
end
