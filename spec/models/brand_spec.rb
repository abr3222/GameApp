# spec/models/brand_spec.rb

require 'rails_helper'

RSpec.describe Brand, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'associations' do
    it { should belong_to(:parent_brand).class_name('Brand').optional }
    it { should have_many(:sub_brands).class_name('Brand').with_foreign_key('parent_brand_id') }
    # Other associations like brand_ambassadors, franchises, etc., can be added here too
  end

  describe 'self-association' do
    let!(:main_brand) { Brand.create(name: 'Main Brand') }
    let!(:sub_brand1) { Brand.create(name: 'Sub Brand 1', parent_brand: main_brand) }
    let!(:sub_brand2) { Brand.create(name: 'Sub Brand 2', parent_brand: main_brand) }

    it 'allows a brand to have sub-brands' do
      expect(main_brand.sub_brands).to contain_exactly(sub_brand1, sub_brand2)
    end

    it 'allows a sub-brand to belong to a main brand' do
      expect(sub_brand1.parent_brand).to eq(main_brand)
    end
  end
end
