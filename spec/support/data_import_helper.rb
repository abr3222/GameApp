# spec/support/data_import_helper.rb
module DataImportHelper
  def import_test_data
    DataImporter.import
  end
end

RSpec.configure do |config|
  config.include DataImportHelper
end