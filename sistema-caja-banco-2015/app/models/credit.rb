class Credit < ActiveRecord::Base
  belongs_to :cuentum
  belongs_to :personal

  validates :nro_tarjeta, :presence => {:message => "No puede estar en blanco"}, 
  						  :numericality => {:only_integer => true, :message => "Solo se aceptan numeros"}
  						  # :uniqueness => {:message => "Esta tarjeta ya existe en la base de datos"}

  validates :personal_id, :presence => {:message => "Tienes que seleccionar un encargado"}
end
