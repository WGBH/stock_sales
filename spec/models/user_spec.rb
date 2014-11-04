require 'rails_helper'

describe User do
  it "is not valid without email" do
    user = User.new(password: "password", password_confirmation: "password",
      first_name: "Test", last_name: "User", phone: "1234567890")
    expect(user).to_not be_valid
  end

  it "email must be valid" do
    user = User.new(email: "testing", password: "password", password_confirmation: "password",
      first_name: "Test", last_name: "User", phone: "1234567890")
    expect(user).to_not be_valid
  end

  it "is not valid without password" do
    user = User.new(email: "email@test.com", password_confirmation: "password",
      first_name: "Test", last_name: "User", phone: "1234567890")
    expect(user).to_not be_valid
  end

  it "password and password confirmation must be the same" do
    user = User.new(email: "email@test.com", password: "password", password_confirmation: "wordpass",
      first_name: "Test", last_name: "User", phone: "1234567890")
    expect(user).to_not be_valid
  end

  it "is not valid without first name" do
    user = User.new(email: "email@test.com", password: "password", password_confirmation: "password",
      last_name: "User", phone: "1234567890")
    expect(user).to_not be_valid
  end

  it "is not valid without last name" do
    user = User.new(email: "email@test.com", password: "password", password_confirmation: "password",
      first_name: "Test", phone: "1234567890")
    expect(user).to_not be_valid
  end

  it "is not valid without phone number" do
    user = User.new(email: "email@test.com", password: "password", password_confirmation: "password",
      first_name: "Test", last_name: "User")
    expect(user).to_not be_valid
  end

  it "is valid with all required fields" do
    user = User.new(email: "email@test.com", password: "password", password_confirmation: "password",
      first_name: "Test", last_name: "User", phone: "1234567890")
    expect(user).to be_valid
  end
end
