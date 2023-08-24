# spec/models/franchise_spec.rb
require 'rails_helper'

RSpec.describe Franchise, type: :model do
  context 'when validating attributes' do
    it { should validate_presence_of(:name) }
  end

  context 'when checking associations' do
    it { should have_many(:players) }
    it { should belong_to(:brand) }
  end
end
