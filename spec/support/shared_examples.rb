shared_examples "person attributes" do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:gender) }
end

shared_examples 'a trainable session' do |trait, trainable_type|
  let(:session) { create(:training_session, trait) }

  it "associates with a #{trainable_type}" do
    expect(session.trainable.class.name).to eq(trainable_type)
  end
end