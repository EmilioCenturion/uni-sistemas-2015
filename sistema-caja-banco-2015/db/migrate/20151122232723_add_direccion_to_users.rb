class AddDireccionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :direccion, :string
  end
end
