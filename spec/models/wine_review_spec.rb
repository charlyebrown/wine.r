require 'rails_helper'

describe WineReview do
  let(:test_review) {WineReview.new(title: "Boom Pow", content: "Delicious",
    user_id: 4, wine_id: 100, rating: 5)}
  let(:test_review_2) {WineReview.new(title: "Boom Pow", content: "Delicious",
    user_id: 4, wine_id: 100, rating: 4)}

  it "belongs to a user" do
    expect(test_review.user_id).to be(4)
  end

  it "references a wine" do
    expect(test_review.wine_id).to be(100)
  end

  it "should not allow a user to have multiple reviews for a single wine" do
    test_review.save
    expect(test_review_2.save).to be(false)
  end

  it { is_expected.to validate_presence_of :rating }

  it { is_expected.to validate_numericality_of :rating }

  it { is_expected.to validate_presence_of :title }

end
