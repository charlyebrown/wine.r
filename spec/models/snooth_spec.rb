require 'rails_helper'

describe Snooth do
  describe "searching for wines" do
    describe '.search_wines' do
      it "returns an empty array when called with a nil or empty string query" do
        expect(Snooth.search_wines(nil)).to eq([])
        expect(Snooth.search_wines("")).to eq([])
      end

      it "returns an array of hashes when given a valid search term" do
        results = Snooth.search_wines("pinot")
        expect(results.class).to eq(Array)
        expect(results).to have_at_least(2).items
        expect(results.first.class).to eq(Hash)
      end
    end
  end
end
