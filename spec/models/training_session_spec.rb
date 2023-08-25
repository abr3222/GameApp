# spec/models/training_session_spec.rb
require 'rails_helper'

RSpec.describe TrainingSession, type: :model do

  context "when multiple sessions are created using FactoryBot" do
    it "has a unique title for each session" do
      session1 = create(:training_session)
      session2 = create(:training_session)
      expect(session1.title).not_to eq(session2.title)
    end
  end

  context 'when checking associations' do
    it { should belong_to(:trainable) }
  end

  shared_examples 'a trainable session' do |model_name|
    let(:session) { create(:training_session, "for_#{model_name.downcase}".to_sym) }

    it "associates with a #{model_name}" do
      expect(session.trainable.class.name).to eq(model_name)
    end
  end

  context 'when associated with a manager' do
    it_behaves_like 'a trainable session', "Manager"
  end

  context 'when associated with a trainer' do
    it_behaves_like 'a trainable session', "Trainer"
  end
end
