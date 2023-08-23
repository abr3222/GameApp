class CreateBrands < ActiveRecord::Migration[6.1]
  def change
    create_table :brands do |t|
      t.string :name
      t.text :description
      t.references :parent_brand, index: true
      t.foreign_key :brands, column: :parent_brand_id, on_delete: :cascade
      t.timestamps
    end
  end
end
