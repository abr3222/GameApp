# spec/models/person_spec.rb
require 'rails_helper'
RSpec.describe Person, type: :model do
  describe 'STI' do
    let!(:team) { Team.create(name: "Team A", city: "Lahore") }

    it 'creates a Manager type' do
      manager = Manager.create(name: "Jane Smith", email: "jane@example.com", gender: "female", team: team)
      expect(manager.type).to eq("Manager")
    end

    it 'creates a Trainer type' do
      trainer = Trainer.create(name: "Jane Smith", email: "jane@example.com", gender: "female", training_approach: "Teach by experience")
      expect(trainer.type).to eq("Trainer")
    end
  end
end