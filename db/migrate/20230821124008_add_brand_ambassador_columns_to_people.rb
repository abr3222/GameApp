class AddBrandAmbassadorColumnsToPeople < ActiveRecord::Migration[6.1]
  def change
    change_table :people do |t|
      t.string :social_media_presence
      t.integer :no_of_followers
    end
  end
end