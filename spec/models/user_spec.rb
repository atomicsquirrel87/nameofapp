require 'rails_helper'

describe User do


  context "everything in place" do
    it "is valid" do
      expect(@user = FactoryBot.build(:user)).to be_valid
    end
  end

  context "when user has no first_name" do
    it "is not valid" do
      expect(@user = FactoryBot.build(:user, first_name: nil)).not_to be_valid
    end
  end

  context "when user has no last_name" do
    it "is not valid" do
      expect(@user = FactoryBot.build(:user, last_name: nil)).not_to be_valid
    end
  end

end
