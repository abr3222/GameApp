require 'rails_helper'

RSpec.describe TrainingSession, type: :model do
  describe 'associations' do
    it { should belong_to(:trainable) }

    # Additional association tests for Team and other related models can be added here.
  end

  describe 'polymorphic association' do
    let!(:team) { Team.create(name: "Team A", city: "Lahore") }
    let!(:trainer) { Trainer.create(name: "Jane Smith", email: "jane@example.com", gender: "female", training_approach: "Teach by experience") }
    let!(:manager) { Manager.create(name: "Jane Smith", email: "jane@example.com", gender: "female", team: team) }

    let!(:ts_for_trainer) { TrainingSession.create(trainable: trainer, team: team, location: "Gym A", date: Date.today) }
    let!(:ts_for_manager) { TrainingSession.create(trainable: manager, team: team, location: "Gym B", date: Date.today) }

    it 'associates with a trainer' do
      expect(ts_for_trainer.trainable).to eq(trainer)
    end

    it 'associates with a manager' do
      expect(ts_for_manager.trainable).to eq(manager)
    end
  end
end
