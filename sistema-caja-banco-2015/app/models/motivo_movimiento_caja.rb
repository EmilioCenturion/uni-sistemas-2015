class MotivoMovimientoCaja < ActiveRecord::Base
	has_many :movimiento_cajas
	validates 	:descripcion, 	:presence => {:message => "No puede estar en blanco"},
								:uniqueness => {:message => "Ya existe este motivo"},
								:length => { in: 6..20 , message: "Debe tener entre 6 y 20 caracteres"}

end
