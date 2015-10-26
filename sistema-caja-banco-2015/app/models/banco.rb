class Banco < ActiveRecord::Base
	belongs_to :pai
	belongs_to :ciudad
	def name_banco
		"#{nombre} - #{sucursal}"
	end

	validates :nombre, :presence => {:message => "No puede estar en blanco"}, 
			  		   :length => {minimum: 6, :message => "Debe tener como minimo 6 caracteres"},
			  		   :length => {maximum: 20, :message => "Debe tener como maximo 20 caracteres"},
			  		   :format => {with: /\A[a-zA-Z]+\z/, message: 'Solo permite letras'}

	validates :direccion, 
					   :presence => {:message => "No puede estar en blanco"}, 
					   :length => {minimum: 6, :message => "Debe tener como minimo 6 caracteres"},
					   :length => {maximum: 50, :message => "Debe tener como maximo 50 caracteres"}

	validates :telefono, 
					   :presence => {:message => "No puede estar en blanco"}, 
					   :length => {minimum: 6, :message => "No es un numero valido"},
					   :numericality => {:only_integer => true, :message => "Debe ser un numero"}	

	validates :correo, :presence => {:message => "No puede estar en blanco"},
					   :email_format => true,
					   :uniqueness => {:message => "El correo ya esta en uso"}

	validates :sucursal, :presence => {:message => "No puede estar en blanco"},
						 :length => {minimum: 6, :message => "Debe tener como minimo 6 caracteres"},
			  		     :length => {maximum: 20, :message => "Debe tener como maximo 20 caracteres"}

	validates :pai_id, :presence => {:message => "Tienes que seleccionar un pais"}
	
	validates :ciudad_id, :presence => {:message => "Tienes que seleccionar una ciudad"}


end
