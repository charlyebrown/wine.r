require 'rails_helper'

describe WineReview do
  let(:test_review) {WineReview.new(title: "Boom Pow", content: "Delicious",
    user_id: 4, wine_id: 100)}

  it "belongs to a user" do
    expect(test_review.user_id).to be(4)
  end

  it "references a wine" do
    expect(test_review.wine_id).to be(100)
  end
end
