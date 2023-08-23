require 'rails_helper'
# spec/models/match_spec.rb
RSpec.describe Match, type: :model do
  # Validations (You can expand on these based on your application requirements)
  it { should validate_presence_of(:date) }
  it { should validate_presence_of(:location) }

  # Relationships
  # Assuming you've set up the relationships as mentioned in previous interactions.

  it 'is invalid without a location' do
    match = Match.new(location: "")
    # Provide other necessary attributes for the match object, if any
    expect(match).not_to be_valid
    expect(match.errors[:location]).to include("can't be blank")
  end

end
