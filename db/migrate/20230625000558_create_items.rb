class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :color
      t.string :brand
      t.string :category
      t.decimal :price

      t.timestamps
    end
  end
end
