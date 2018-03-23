require 'rails_helper'

describe User do

  context "everything in place" do
    it "is valid" do
      expect(User.new(email: "bla@bla.com", password: "123456", id: 1, first_name: "Don", last_name: "Dom")).to be_valid
    end
  end

  context "when user has no first_name" do
    it "is not valid" do
      expect(User.new(email: "bla@bla.com", password: "123456", id: 1, first_name: "", last_name: "Dom")).not_to be_valid
    end
  end

  context "when user has no last_name" do
    it "is not valid" do
      expect(User.new(email: "bla@bla.com", password: "123456", id: 1, first_name: "Don", last_name: "")).not_to be_valid
    end
  end

end
