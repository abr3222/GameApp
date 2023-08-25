class Person < ApplicationRecord
  # include StiPolymorphicType
  validates :name, :email, :gender, presence: true
end