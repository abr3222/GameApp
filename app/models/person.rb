class Person < ApplicationRecord

  validates :name, presence: true
  validates :email, presence: true
  validates :gender, presence: true

  validates :shirt_number, inclusion: { in: 1..99, message: "Shirt number should be between 1 and 99" }, allow_nil: true
  validates :injury_status, inclusion: { in: [true, false] }, allow_nil: true

  validates :social_media_presence, presence: true, if: :brand_ambassador?
  validates :no_of_followers, numericality: { only_integer: true, greater_than: 0 }, if: :brand_ambassador?

  def brand_ambassador?
    type == "BrandAmbassador"  # Adjust this condition based on your STI setup.
  end

end
