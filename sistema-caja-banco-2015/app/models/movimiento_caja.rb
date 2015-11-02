class MovimientoCaja < ActiveRecord::Base
  belongs_to :apertura_caja
  belongs_to :motivo_movimiento_caja
  has_many :cheque_recibidos

  accepts_nested_attributes_for :cheque_recibidos, allow_destroy: true

  before_create :bc_movimiento
  after_create :ac_movimiento


	protected
		def bc_movimiento
			self.fecha = Time.now
			monto_cheque = 0
			self.cheque_recibidos.each do |cheque|
				monto_cheque = monto_cheque + cheque.monto
			end
			self.monto_cheque = monto_cheque 
		end

		def ac_movimiento
			saldo_efectivo = self.apertura_caja.saldo_final_efectivo
			saldo_cheque = self.apertura_caja.saldo_final_cheque
			if self.es_ingreso 
				saldo_efectivo = saldo_efectivo + self.monto_efectivo
				saldo_cheque = saldo_cheque + self.monto_cheque
			else
				saldo_efectivo = saldo_efectivo - self.monto_efectivo
				saldo_cheque = saldo_cheque - self.monto_cheque
			end
			AperturaCaja.update(self.apertura_caja_id, saldo_final_efectivo: saldo_efectivo)
			AperturaCaja.update(self.apertura_caja_id, saldo_final_cheque: saldo_cheque)
		end
end
