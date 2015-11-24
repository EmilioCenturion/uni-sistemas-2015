class Chequera < ActiveRecord::Base
  audited
  belongs_to :cuentum
  belongs_to :personal
  has_many :cheque_emitidos

   def name_chequera
    "#{self.cuentum.banco.nombre} - cta.#{self.cuentum.nro_cuenta} - #{nro_primero} al #{nro_ultimo}"
  end
  validates :nro_primero, :presence => {:message => "No puede estar en blanco"}, 
  						  
  						  :numericality => {:only_integer => true, :greater_than_or_equal_to => 0, :message => "Solo se aceptan numeros"},
  						  :uniqueness => { :scope => :nro_ultimo, message: "Esta chequera ya existe" }


  validates :nro_ultimo, :presence => {:message => "No puede estar en blanco"}, 
  						  :numericality => {:only_integer => true, :greater_than_or_equal_to => 0, :message => "Solo se aceptan numeros"}

 
  validates :personal_id, :presence => {:message => "Tienes que seleccionar un encargado"}

  validates :estado, :presence => {:message => "Tienes que seleccionar un estado"}

  validate :mayor
  
  def mayor

  	if nro_primero > nro_ultimo
  		errors.add(:nro_primero, "El primer numero no puede ser superior al ultimo numero")
  	end	
  end

end
