class Ciudad < ActiveRecord::Base
	has_many :bancos
	def name_ciudad
		"#{nombre}"
	end

		validates 	:nombre, 	:presence => {:message => "No puede estar en blanco"},
							:uniqueness => {:message => "Ya existe esta Ciudad"},
							:length => {minimum: 6, :message => "Debe tener como minimo 4 caracteres"},
			  		   		:length => {maximum: 20, :message => "Debe tener como maximo 20 caracteres"},
			  		   		:format => {with: /[a-zA-ZÃ�ï¿½Ã�Â±Ã�Â¡Ã�Â©Ã�Â­Ã�Â³Ã�Âº]/, message: 'Solo se permiten letras'}

end
