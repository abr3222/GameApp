require 'rails_helper'

RSpec.describe Brand, type: :model do

  let(:brand) { build(:brand) }
  let(:franchises) { build_list(:franchise, 3, brand: brand) } # Build List strategies Using traits

  context 'when validating fields' do
    it { should validate_presence_of(:name) }
  end

  context 'when checking associations' do
    it { should belong_to(:parent_brand).class_name('Brand').optional }
    it { should have_many(:sub_brands).class_name('Brand').with_foreign_key('parent_brand_id') }
    it { should have_many(:franchises) }
  end

  context 'when using build strategy' do
    it 'can have multiple franchises' do
      brand.franchises = franchises

      expect(brand.franchises.size).to eq(3)
    end
  end

  context 'when handling self associations' do
    let!(:main_brand) { create(:brand, sub_brands_count: 2) }

    it 'allows a brand to have sub-brands' do
      expect(main_brand.sub_brands.count).to eq(2)
    end
  end
end