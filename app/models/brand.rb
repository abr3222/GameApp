class Brand < ApplicationRecord
  # Relations
  belongs_to :parent_brand, class_name: "Brand", optional: true
  has_many :sub_brands, class_name: 'Brand', foreign_key: 'parent_brand_id'
  has_many :brand_ambassadors
  has_many :franchises
  has_many :teams, through: :franchises

  # Validations
  validates :name, presence: true
end