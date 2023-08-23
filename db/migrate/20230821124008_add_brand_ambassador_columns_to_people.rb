class AddBrandAmbassadorColumnsToPeople < ActiveRecord::Migration[6.1]
  def change
    add_column :people, :social_media_presence, :string
    add_column :people, :no_of_followers, :integer
  end
end

