require 'rails_helper'

describe SnoothFood do
  describe "searching for wines by food" do
    describe '.search_by_food' do

      it "returns an array of hashes when given a valid search term" do
        results = SnoothFood.search_by_food(10, 1)
      end
    end
  end
end
