class BrandAmbassador < Person
  validates :social_media_presence, presence: true
  validates :no_of_followers, numericality: { only_integer: true, greater_than: 0 }

  # Relations
  belongs_to :team, optional: true
  belongs_to :brand
end