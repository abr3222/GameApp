# spec/models/training_session_spec.rb
require 'rails_helper'

RSpec.describe TrainingSession, type: :model do

  describe 'validations' do
    context "when multiple sessions are created using FactoryBot" do
      it "has a unique title for each session" do
        session1 = create(:training_session)
        session2 = create(:training_session)
        expect(session1.title).not_to eq(session2.title)
      end
    end
  end

  describe 'associations' do
    it { should belong_to(:trainable) }
  end

  describe 'trainable associations' do
    context 'when associated with a manager' do
      it_behaves_like 'a trainable session', "Manager"
    end

    context 'when associated with a trainer' do
      it_behaves_like 'a trainable session', "Trainer"
    end
  end

end
