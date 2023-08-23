class CreatePeople < ActiveRecord::Migration[6.1]
  def change
    create_table :people do |t|
      t.string :name
      t.date :date_of_birth
      t.text :address
      t.string :phone_number
      t.string :email
      t.string :gender
      t.date :contract_start_date
      t.date :contract_end_date
      t.string :type
      t.timestamps
    end
  end
end
