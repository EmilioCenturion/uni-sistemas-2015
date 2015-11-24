class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :apellido, :string
    add_column :users, :numero_ci, :integer
    add_reference :users, :ciudad, index: true
    add_reference :users, :pai, index: true
    add_column :users, :telefono, :string
    add_column :users, :celular, :string
  end
end
