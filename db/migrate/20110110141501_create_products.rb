class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.text :body
      t.float :price
      t.integer :count

      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
