class AddDetailsToChequeRecibidos < ActiveRecord::Migration
  def change
    add_reference :cheque_recibidos, :movimiento_caja, index: true
    add_column :cheque_recibidos, :depositado, :boolean
  end
end
