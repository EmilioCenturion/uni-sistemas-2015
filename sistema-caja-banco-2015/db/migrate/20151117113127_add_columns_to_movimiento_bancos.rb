class AddColumnsToMovimientoBancos < ActiveRecord::Migration
  def change
    add_column :movimiento_bancos, :saldo_inicial, :decimal
  end
end
