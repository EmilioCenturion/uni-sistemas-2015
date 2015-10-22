class Banco < ActiveRecord::Base
	belongs_to :pai
	belongs_to :ciudad
	def name_banco
		"#{nombre}"
	end

	validates :nombre, :presence => {:message => "No puede estar en blanco"}, :length => {minimum: 6, maximum: 30, :message => "Debe tener entre 6 y 30 caracteres"}
	validates :direccion, :presence => {:message => "No puede estar en blanco"}, :length => {minimum: 6, :message => "Debe tener mas de 6 caracteres"}
	validates :telefono, :presence => {:message => "No puede estar en blanco"}, :numericality => {:only_integer => true, :message => "Telefono debe ser numérico"}

end
