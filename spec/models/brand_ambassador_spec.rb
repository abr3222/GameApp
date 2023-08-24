require 'rails_helper'

RSpec.describe BrandAmbassador, type: :model do
  it { is_expected.to validate_presence_of(:social_media_presence) }
  it { is_expected.to validate_numericality_of(:no_of_followers) }
end
