# spec/models/person_spec.rb
require 'rails_helper'

RSpec.describe Person, type: :model do
  context 'when validating shared attributes' do
    it_behaves_like "person attributes"
  end

  context 'when creating subclasses' do
    it 'stores a Manager type' do
      manager = create(:manager)
      expect(manager.type).to eq("Manager")
    end

    it 'stores a Trainer type' do
      trainer = create(:trainer)
      expect(trainer.type).to eq("Trainer")
    end

    it 'stores a Player type' do
      player = create(:player)
      expect(player.type).to eq("Player")
    end

    it 'stores a brand_ambassador type' do
      brand_ambassador = create(:brand_ambassador)
      expect(brand_ambassador.type).to eq("BrandAmbassador")
    end
  end
end
