require 'rails_helper'

describe SnoothFood do
  describe "searching for wines by food" do
    describe '.search_by_food' do

      it "returns an array of hashes when given a valid search term" do
        results = SnoothFood.search_by_food(10, 1, "rose")
      end

      describe ".convert_user_preferences" do
        preference = SnoothFood.convert_user_preferences("red")
        it "returns an integer" do
          expect(preference).to eq(60)
        end
      end
    end
  end
end
