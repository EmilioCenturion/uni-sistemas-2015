class CreateBoletaDepositoDetalles < ActiveRecord::Migration
  def change
    create_table :boleta_deposito_detalles do |t|
      t.references :boleta_deposito, index: true
      t.references :cheque_recibido, index: true

      t.timestamps
    end
  end
end
