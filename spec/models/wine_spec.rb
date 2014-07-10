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
