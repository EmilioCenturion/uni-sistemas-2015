class CreateCuenta < ActiveRecord::Migration
  def change
    create_table :cuenta do |t|
      t.integer :nro_cuenta
      t.decimal :saldo, default: 0 
      t.references :banco, index: true

      t.timestamps
    end
  end
end
