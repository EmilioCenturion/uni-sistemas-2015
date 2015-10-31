class Pai < ActiveRecord::Base
	has_many :bancos
	def name_pais
		"#{nombre}"
	end

	validates 	:nombre, 	:presence => {:message => "No puede estar en blanco"},
							:length => {minimum: 6, :message => "Debe tener como minimo 4 caracteres"},
			  		   		:length => {maximum: 20, :message => "Debe tener como maximo 20 caracteres"},
			  		   		:format => {with: /[a-zA-ZÃ�ï¿½Ã�Â±Ã�Â¡Ã�Â©Ã�Â­Ã�Â³Ã�Âº]/, message: 'Solo permite letras'},
			  		   		:uniqueness => {:message => "Ya existe este Pais"}
	
end
