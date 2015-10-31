class Credit < ActiveRecord::Base
  belongs_to :cuentum
  belongs_to :personal

  validates :nro_tarjeta, :presence => {:message => "No puede estar en blanco"}, 
  						  :numericality => {:only_integer => true, :message => "Solo se aceptan numeros"},
  						  :uniqueness => {:message => "Esta tarjeta ya existe en la base de datos"},
  						  :format => {:multiline => true, with: /^\d*$/, message: 'No puede ser negativo'}

  validates :personal_id, :presence => {:message => "Tienes que seleccionar un encargado"}
  validates :estado, :presence => {:message => "Tienes que seleccionar un encargado"}

end
