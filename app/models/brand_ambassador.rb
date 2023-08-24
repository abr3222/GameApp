class BrandAmbassador < Person
  # Relations
  belongs_to :team, optional: true
  belongs_to :brand
end