class MotivoMovimientoCaja < ActiveRecord::Base
	has_many :movimiento_cajas
	validates 	:descripcion, 	:presence => {:message => "No puede estar en blanco"},
								:uniqueness => {:message => "Ya existe este motivo"}
end
