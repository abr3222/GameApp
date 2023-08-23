require 'rails_helper'
# spec/models/team_spec.rb
RSpec.describe Team, type: :model do
  # Validations
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:city) }

  # Relationships
  it { should have_many(:franchises) }
  it { should have_many(:players) } # Assuming the foreign key on `people` table is `team_id`.

end
