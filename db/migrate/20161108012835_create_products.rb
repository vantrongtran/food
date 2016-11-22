class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :category_id
      t.float :price
      t.integer :quanty
      t.string :image, default: "product.jpg"
      t.string :description
      t.integer :types, default: 0
      t.integer :user_id
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
