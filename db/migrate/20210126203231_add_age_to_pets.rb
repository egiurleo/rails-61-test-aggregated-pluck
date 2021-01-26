class AddAgeToPets < ActiveRecord::Migration[6.0]
  def change
    add_column :pets, :age, :bigint
  end
end
