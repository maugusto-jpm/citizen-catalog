class CreateCountryCodes < ActiveRecord::Migration[7.0]
  def change
    create_table :country_codes do |t|
      t.string :code
      t.string :country_name

      t.timestamps
    end
  end
end
