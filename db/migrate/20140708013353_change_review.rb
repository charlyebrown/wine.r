class ChangeReview < ActiveRecord::Migration
  def change
      rename_table :reviews, :wine_reviews
  end
end
