class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string 	:content
      t.references :product
      t.integer :rate

      t.timestamps
    end
  end
end
