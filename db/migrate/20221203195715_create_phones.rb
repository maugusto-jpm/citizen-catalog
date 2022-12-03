class CreatePhones < ActiveRecord::Migration[7.0]
  def change
    create_table :phones do |t|
      t.string :country_code
      t.string :number

      t.timestamps
    end
  end
end