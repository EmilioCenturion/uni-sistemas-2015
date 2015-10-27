class Chequera < ActiveRecord::Base
  belongs_to :cuentum
  belongs_to :personal

  validates :nro_primero, :presence => {:message => "No puede estar en blanco"}, 
  						  :numericality => {:only_integer => true, :message => "Solo se aceptan numeros"}

  validates :nro_ultimo, :presence => {:message => "No puede estar en blanco"}, 
  						  :numericality => {:only_integer => true, :message => "Solo se aceptan numeros"}

  validates :personal_id, :presence => {:message => "Tienes que seleccionar un encargado"}

end
