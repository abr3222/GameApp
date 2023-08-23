require 'rails_helper'

RSpec.describe Manager, type: :model do
  context "validations" do
    it { should validate_presence_of(:name) } # Assuming a name attribute exists
    # Add other attribute validations as required
  end

  context "associations" do
    # Assuming a Manager belongs to a Franchise
    it { should have_many(:training_sessions)}
    # Add other association tests as needed
  end
end
