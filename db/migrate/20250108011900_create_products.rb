class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :url
      t.decimal :price
      t.datetime :last_scraped_at

      t.timestamps
    end
  end
end
