class AddBrandIdToPeople < ActiveRecord::Migration[6.1]
  def change
    add_column :people, :brand_id, :bigint
  end
end
