class MotivoMovimientoBanco < ActiveRecord::Base
	has_many :movimiento_bancos

	validates 	:descripcion, 	:presence => {:message => "No puede estar en blanco"},
								:uniqueness => {:message => "Ya existe este motivo"},
								:length => { in: 6..20 , message: "Debe tener entre 6 y 20 caracteres"}
end
