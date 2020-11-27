class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false, default: ''
      t.text :description, null: false, default: ''
      t.decimal :price, precision: 5, scale: 2, null: false
      t.string :image, default: 'https://placeimg.com/480/640/tech'

      t.timestamps
    end
  end
end
