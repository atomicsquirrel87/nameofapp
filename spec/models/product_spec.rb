require 'rails_helper'

describe Product do

  before do
    @user = FactoryBot.create(:user)
    @product = FactoryBot.create(:product)
    @product.comments.create!(rating: 1, user: @user, body: "Awful")
    @product.comments.create!(rating: 3, user: @user, body: "Ok")
    @product.comments.create!(rating: 5, user: @user, body: "Great")
  end

  it "returns the average rating of all comments" do
    expect(@product.average_rating).to eq 3
  end

  it "not valid without a name" do
    expect(@product = FactoryBot.build(:product, name: nil)).not_to be_valid
  end

end
