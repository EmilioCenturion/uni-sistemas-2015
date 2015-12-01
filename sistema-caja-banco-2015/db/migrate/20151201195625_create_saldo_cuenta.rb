class CreateSaldoCuenta < ActiveRecord::Migration
  def change
    create_table :saldo_cuenta do |t|
      t.decimal :saldo_debe
      t.decimal :saldo_haber
      t.date :fecha
      t.references :cuenta_contable, index: true
      t.references :periodo_fiscal, index: true

      t.timestamps
    end
  end
end
