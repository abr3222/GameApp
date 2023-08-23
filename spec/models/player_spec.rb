require 'rails_helper'

RSpec.describe Player, type: :model do
  context "validations" do
    it { should validate_presence_of(:name) } # Assuming a name attribute exists
    # Add other attribute validations as required
  end

  context "associations" do
    # Assuming a Player belongs to a Franchise
    # Add other association tests as needed
  end
end

