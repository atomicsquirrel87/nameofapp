require 'rails_helper'

describe Comment do

  let(:product) { Product.create!(name: "Scarf", id: 2) }
  let(:user) { User.create!(email: "bla@bla.com", password: "123456", id: 1, first_name: "Don", last_name: "Dom") }

  context "when everything in place" do
    it "is valid" do
      expect(Comment.new(body:"Great", rating: 5, user: user, product: product)).to be_valid
    end
  end

  context "when comment has no body" do
    it "is not valid" do
      expect(Comment.new(body:"", rating: 5, user: user, product: product)).not_to be_valid
    end
  end

  context "when comment has no rating" do
    it "is not valid" do
      expect(Comment.new(body:"Great", rating: nil, user: user, product: product)).not_to be_valid
    end
  end

  context "when comment has no user" do
    it "is not valid" do
      expect(Comment.new(body:"Great", rating: 5, user: nil, product: product)).not_to be_valid
    end
  end

  context "when comment has no product" do
    it "is not valid" do
      expect(Comment.new(body:"Great", rating: 5, user: user, product: nil)).not_to be_valid
    end
  end





end
