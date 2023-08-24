require 'rails_helper'

RSpec.describe Brand, type: :model do
  context 'when validating fields' do
    it { should validate_presence_of(:name) }
  end

  context 'when checking associations' do
    it { should belong_to(:parent_brand).class_name('Brand').optional }
    it { should have_many(:sub_brands).class_name('Brand').with_foreign_key('parent_brand_id') }
  end

  context 'when handling self associations' do
    let!(:main_brand) { create(:brand) }
    let!(:sub_brands) { create_list(:brand, 2, parent_brand: main_brand) }

    it 'allows a brand to have sub-brands' do
      expect(main_brand.sub_brands).to match_array(sub_brands)
    end
  end
end