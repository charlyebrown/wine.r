require 'rails_helper'

describe Wine do
  let(:pinot) { Wine.new( name: "World's Best Pinot Grigio",
      vintage: 2001,
      region: "Great Lakes",
      code: 9827349274)}

  let(:cab_franc) { Wine.new( name: "Cab Franc",
      vintage: 2012,
      region: "Northeast",
      code: 9827349274)}

  it "is valid with a name and vintage" do
    expect(pinot).to be_valid
  end

  it "does not allow a wines to have the same code" do
    pinot.save!
    expect(cab_franc).to be_invalid
  end
end

describe ".add_to_user_favorites" do

  it "is expected to not allow users to add same wine twice" do
    wine1 = Wine.create(name: 'Delicious Wine', vintage: 1999, vineyard: "Long Island",
    image: "http://flickholdr.com/200/300/wine")
    .wines << wine1
    expect(charlye.wines << wine1 ).to be(false)
  end
end
