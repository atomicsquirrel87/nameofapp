class Product < ApplicationRecord
  has_many :orders
  if Rails.env.production?
    def self.search(search_term)
      Product.where("name ilike ?", "%#{search_term}%")
    end
  else Rails.env.development?
    def self.search(search_term)
      Product.where("name LIKE ?", "%#{search_term}%")
    end
  end
end
