class Caja < ActiveRecord::Base
	has_many :apertura_cajas
	accepts_nested_attributes_for :apertura_cajas, allow_destroy: true

	before_save :set_nro_caja

	protected
		def set_nro_caja
			self.nro_caja = Caja.last.nro_caja + 1
		end
end
