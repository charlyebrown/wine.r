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
  
end
