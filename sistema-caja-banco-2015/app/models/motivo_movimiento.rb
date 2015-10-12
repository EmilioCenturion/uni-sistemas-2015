class MotivoMovimiento < ActiveRecord::Base
	has_many :movimiento_cajas
	has_many :movimiento_bancos
end
