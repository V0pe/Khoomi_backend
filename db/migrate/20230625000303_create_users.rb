class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :country
      t.date :date_of_birth
      t.string :password

      t.timestamps
    end
  end
end
