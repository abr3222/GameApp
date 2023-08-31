# spec/support/shared_examples.rb
shared_examples "person attributes" do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:gender) }
end

shared_examples 'a trainable session' do |model_name|
  let(:session) { create(:training_session, "for_#{model_name.downcase}".to_sym) }

  it "associates with a #{model_name}" do
    expect(session.trainable.class.name).to eq(model_name)
  end
end

# This can be placed at the beginning of your spec file or even better in a separate helper file.
shared_examples 'returns expected teams count' do |expected_count|
  it { expect(subject.count).to eq(expected_count) }
end

shared_examples 'matches team names' do |expected_names|
  it { expect(subject.pluck(:name)).to match_array(expected_names) }
end


# shared_examples 'a trainable session' do |trait, trainable_type|
#   let(:session) { create(:training_session, trait) }
#
#   it "associates with a #{trainable_type}" do
#     expect(session.trainable.class.name).to eq(trainable_type)
#   end
# end

