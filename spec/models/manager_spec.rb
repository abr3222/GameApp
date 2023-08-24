# spec/models/manager_spec.rb
require 'rails_helper'

RSpec.describe Manager, type: :model do
  subject { build(:manager) }

  context 'when validating shared attributes' do
    it_behaves_like "person attributes"
  end

  context 'validations' do
    it { should validate_presence_of(:managing_since) }

    it { should validate_presence_of(:staff_count) }
    it { should validate_numericality_of(:staff_count).only_integer.is_greater_than_or_equal_to(5).is_less_than_or_equal_to(50) }

    it { should validate_presence_of(:leadership_style) }
    it { should validate_length_of(:leadership_style).is_at_most(255) }

    it { should validate_presence_of(:strategic_plans) }
  end

  context 'when checking associations' do
    it { should have_many(:training_sessions) }
  end
end
