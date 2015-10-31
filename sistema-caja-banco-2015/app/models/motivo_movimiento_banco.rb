class MotivoMovimientoBanco < ActiveRecord::Base
	validates 	:descripcion, 	:presence => {:message => "No puede estar en blanco"},
								:uniqueness => {:message => "Ya existe este motivo"}
end
