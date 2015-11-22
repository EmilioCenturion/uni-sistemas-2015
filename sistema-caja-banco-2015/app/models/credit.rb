class Credit < ActiveRecord::Base
  audited
  belongs_to :cuentum
  belongs_to :personal
  def name_tarjeta
   "#{self.cuentum.banco.nombre} - cta.#{self.cuentum.nro_cuenta} - nro.#{ nro_tarjeta}"
  end
  validates :nro_tarjeta, :presence => {:message => "No puede estar en blanco"}, 
  						  :numericality => {:only_integer => true, :message => "Solo se aceptan numeros"},
  						  :format => {:multiline => true, with: /^\d*$/, message: 'No puede ser negativo'},
                :uniqueness => { :scope => :cuentum_id, message: "Esta tarjeta ya existe" }

  validates :personal_id, :presence => {:message => "Tienes que seleccionar un encargado"}
  validates :estado, :presence => {:message => "Tienes que seleccionar un encargado"}

end
