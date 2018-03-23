require 'rails_helper'

describe Product do

  let(:product) { Product.create!(name: "dog scarf") }

  let(:user) { User.create!(email: "bla@bla.com", password: "123456", id: 1, first_name: "Don", last_name: "Dom")}

  before do
    product.comments.create!(rating: 1, user: user, body: "Awful")
    product.comments.create!(rating: 3, user: user, body: "Ok")
    product.comments.create!(rating: 5, user: user, body: "Great")
  end

  it "returns the average rating of all comments" do
    expect(product.average_rating).to eq 3
  end

  it "not valid without a name" do
    expect(Product.new(description: "Great for outside!")).not_to be_valid
  end

end
