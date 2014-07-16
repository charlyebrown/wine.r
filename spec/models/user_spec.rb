require 'rails_helper'

describe User do
  let(:charlye) { User.new( username: 'charlyebrown',
    name: 'Charlye Tran',
    password: "123",
    password_confirmation: "123",
    email: "charlyetran@gmail.com",
    birthday: "Dec. 26, 1982")}

  it "is valid with a username and password" do
    expect(charlye).to be_valid
  end

  it "is expected not to allow users to have the same username" do
    charlye.save!
    k = User.new(username: 'charlyebrown',
      name: 'Khanh Tran',
      password: "123",
      password_confirmation: "123",
      email: "khanhtran@gmail.com",
      birthday: "Jan 28, 1979")
    expect(k).to be_invalid
  end

  it "is expected to be able to add a favorite wine" do
    wine1 = Wine.create(name: 'Delicious Wine', vintage: 1999, vineyard: "Long Island",
    image: "http://flickholdr.com/200/300/wine")
    charlye.wines << wine1
  end

  it "is expected to not allow users to add same wine twice" do
    wine1 = Wine.create(name: 'Delicious Wine', vintage: 1999, vineyard: "Long Island",
    image: "http://flickholdr.com/200/300/wine")
    charlye.wines << wine1
    expect(charlye.wines << wine1 ).to be(false)
  end

end
