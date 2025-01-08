class AddCategoriaToProducts < ActiveRecord::Migration[8.0]
  def change
    add_reference :products, :categoria, null: false, foreign_key: true
  end
end
