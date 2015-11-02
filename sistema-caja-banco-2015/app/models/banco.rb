class Banco < ActiveRecord::Base
	belongs_to :pai
	belongs_to :ciudad
	def name_banco
		"#{nombre} - #{sucursal}"
	end

	
	validates :nombre, :presence => {:message => "No puede estar en blanco"}, 
			  		   :length => { in: 6..20 , message: "Debe tener entre 6 y 20 caracteres"},
			  		   :format => {with: /[a-zA-ZÃ�ï¿½Ã�Â±Ã�Â¡Ã�Â©Ã�Â­Ã�Â³Ã�Âº]/, message: 'Solo permite letras'}
			  		   
	validates :direccion, 
					   :presence => {:message => "No puede estar en blanco"}, 
					   :length => { in: 6..50 , message: "Debe tener entre 6 y 50 caracteres"}
					  
	validates :telefono, 
					   :presence => {:message => "No puede estar en blanco"}, 
					   :length => {minimum: 6, :message => "No es un numero valido"},
					   :format => { :multiline => true, with: /^([0-9]|-)*$/, message: "Solo permite numeros. (En caso de
					   	ingresar mas telefonos separe con guiones)"},

					   :numericality => {:only_integer => true, :message => "Debe ser un numero"},
					   :uniqueness => {:message => "Este numero ya existe, vuelva a intentarlo"}	

	validates :correo, :presence => {:message => "No puede estar en blanco"},
					   :email_format => true,		
					   :uniqueness => {:message => "El correo ya esta en uso, vuelva a intentarlo"}

	validates :sucursal, :presence => {:message => "No puede estar en blanco"},
						 :length => { in: 6..20 , message: "Debe tener entre 6 y 20 caracteres"},
			  		     :uniqueness => { :scope => :nombre, message: "Esta sucursal ya existe, vuelva a intentarlo" }

	validates :pai_id, :presence => {:message => "Tienes que seleccionar un pais"}
	
	validates :ciudad_id, :presence => {:message => "Tienes que seleccionar una ciudad"}
end
