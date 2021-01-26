class CreatePets < ActiveRecord::Migration[6.1]
  def change
    create_table :pets do |t|
      t.string :name

      t.timestamps
    end

    add_reference :pets, :person, foreign_key: true
  end
end
