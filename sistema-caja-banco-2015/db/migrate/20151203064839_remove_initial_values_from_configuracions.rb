class RemoveInitialValuesFromConfiguracions < ActiveRecord::Migration
  def change
    remove_column :configuracions, :cabecera_impresion, :string
  end
end
