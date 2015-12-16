class CreateAsientoDetalles < ActiveRecord::Migration
  def change
    create_table :asiento_detalles do |t|
      t.references :asiento, index: true
      t.references :cuenta_contable, index: true
      t.decimal :importe
      t.boolean :es_credito
      t.string :concepto
      
      t.timestamps
    end
  end
end
