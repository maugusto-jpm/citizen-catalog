class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :street, null: false
      t.string :zip_code, null: false
      t.string :neighborhood, null: false
      t.string :uf, null: false
      t.string :complement
      t.string :igbe_code

      t.timestamps
    end
  end
end
