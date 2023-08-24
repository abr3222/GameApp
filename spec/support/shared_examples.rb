RSpec.shared_examples "person attributes" do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:gender) }
end