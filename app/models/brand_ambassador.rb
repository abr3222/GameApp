class BrandAmbassador < Person
  # Attributes:
  # social_media_presence, no_of_followers
  validates :name, presence: true
  validates :email, presence: true
  validates :gender, presence: true
  validates :team_id, presence: true

  belongs_to :team, optional: true
  belongs_to :brand
end
