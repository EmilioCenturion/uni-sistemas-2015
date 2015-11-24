class Pai < ActiveRecord::Base
	audited
	has_many :bancos
	def name_pais
		"#{nombre}"
	end

	validates 	:nombre, 	:presence => {:message => "No puede estar en blanco"},
							:length => { in: 6..20 , message: "Debe tener entre 6 y 20 caracteres"},
			  		   		:format => {with: /[a-zA-ZÃ�ï¿½Ã�Â±Ã�Â¡Ã�Â©Ã�Â­Ã�Â³Ã�Âº]/, message: 'Solo permite letras'},
			  		   		:uniqueness => {:message => "Ya existe este Pais"}
	
end
