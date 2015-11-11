class ChequeRecibido < ActiveRecord::Base
  belongs_to :banco
  belongs_to :cliente
  belongs_to :movimiento_caja

validates :nro_cheque,  :presence => {:message => "No puede estar en blanco"},
                        :numericality => {:only_double => true, :message => "Debe ser un numero"},
                        :length => {minimum: 8, :message => "No es un numero valido"},
                        :uniqueness => { :scope => :banco_id, message: "Este cheque ya existe" }
                        
  validates :banco_id, :presence => {:message => "Seleccione un banco"}

  validates :cliente_id, :presence => {:message => "Seleccione un cliente"}

  validates :monto, :presence => {:message => "No puede estar en blanco"},
  				    :numericality => {:only_double => true,:greater_than => 0, :message => "Debe ser un numero"}

  def name_cheque_recibido
		"#{nro_cheque} - #{monto}"
  end
  
end
