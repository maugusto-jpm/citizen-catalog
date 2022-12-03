class CreateCitizens < ActiveRecord::Migration[7.0]
  def change
    create_table :citizens do |t|
      t.string :status
      t.string :name
      t.string :cpf, unique: true
      t.string :email
      t.date :birthdate
      t.string :cns
      t.belongs_to :address, null: false, foreign_key: true
      t.belongs_to :phone, null: false, foreign_key: true

      t.timestamps
    end
  end
end
