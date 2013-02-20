class CreatePosts < ActiveRecord::Migration
  def change
      create_table :posts do |t|
      t.string  :name
      t.text    :description
      t.float   :price
      t.string  :email
      t.integer :category_id
      t.string  :secret_key

      t.timestamps
    end 
  end
end
