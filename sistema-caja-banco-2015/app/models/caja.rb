class Caja < ActiveRecord::Base
	audited
	has_many :apertura_cajas
	has_many :boleta_depositos, :through => :apertura_cajas, inverse_of: :boleta_depositos
	has_many :movimiento_cajas, :through => :apertura_cajas, inverse_of: :movimiento_cajas

	before_create :set_nro_caja

	def name_caja
		"Nro: #{nro_caja} - Efectivo: #{saldo_inicial_efectivo} - Cheque: #{saldo_inicial_cheque}"
	end

	before_destroy :bd_puede_eliminar
	
	protected

	def bd_puede_eliminar
		AperturaCaja.where(:caja_id => self.id).empty?
	end
	
	def set_nro_caja
		if Caja.last.nil?
			self.nro_caja = 1
		else
			self.nro_caja = Caja.last.nro_caja + 1
		end
	end
end
