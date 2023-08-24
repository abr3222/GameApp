# spec/models/training_session_spec.rb
require 'rails_helper'

RSpec.describe TrainingSession, type: :model do
  context 'when checking associations' do
    it { should belong_to(:trainable) }
  end

  context 'when associated with a trainer' do
    let(:trainer) { create(:trainer) }
    let!(:session) { create(:training_session, trainable: trainer) }

    it 'is associated with the correct trainable type' do
       expect(session.trainable.class.name).to eq("Trainer")
    end
  end

  context 'when associated with a manager' do
    let(:manager) { create(:manager) }
    let!(:session) { create(:training_session, trainable: manager) }

    it 'is associated with the correct trainable type' do
      # expect(session.trainable_type).to eq("Manager")
      expect(session.trainable.class.name).to eq("Manager")
    end
  end
end
