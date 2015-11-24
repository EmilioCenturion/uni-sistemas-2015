class MotivoMovimientoCaja < ActiveRecord::Base
	audited
	has_many :movimiento_cajas
	validates 	:descripcion, 	:presence => {:message => "No puede estar en blanco"},
								:uniqueness => {:message => "Ya existe este motivo"},
								:length => { in: 4..20 , message: "Debe tener entre 4 y 20 caracteres"}

end
