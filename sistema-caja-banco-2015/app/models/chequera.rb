class Chequera < ActiveRecord::Base
  belongs_to :cuentum
  belongs_to :personal

  validates :nro_primero, :presence => {:message => "No puede estar en blanco"}, 
  						  
  						  :numericality => {:only_integer => true, :message => "Solo se aceptan numeros"}
  						  

  validates :nro_ultimo, :presence => {:message => "No puede estar en blanco"}, 
  						  :numericality => {:only_integer => true, :message => "Solo se aceptan numeros"}

 
  validates :personal_id, :presence => {:message => "Tienes que seleccionar un encargado"}

  validates :estado, :presence => {:message => "Tienes que seleccionar un estado"}

  validate :mayor
  
  def mayor

  	if nro_primero > nro_ultimo
  		errors.add(:nro_primero, "El primer numero no puede ser superior al ultimo numero")
  	end	
  end

end
