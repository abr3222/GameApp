RSpec.describe Trainer, type: :model do
  context 'validations' do
    it { should validate_presence_of(:training_approach) }
    it { should validate_presence_of(:specialization) }
    it { should validate_presence_of(:experience) }
    it { should validate_numericality_of(:experience).only_integer.is_greater_than(0) }
    it { should validate_presence_of(:certifications) }
  end

  context 'relationships' do
    it { should have_many(:training_sessions)}
    it { should belong_to(:franchise).optional }
  end
end
