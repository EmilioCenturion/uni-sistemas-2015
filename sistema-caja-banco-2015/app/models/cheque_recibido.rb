class ChequeRecibido < ActiveRecord::Base
  audited
  belongs_to :banco
  belongs_to :cliente
  belongs_to :movimiento_caja

validates :nro_cheque,  :presence => {:message => "No puede estar en blanco"},
                        :numericality => {:only_double => true, :greater_than_or_equal_to => 0, :message => "Debe ser un numero"},
                        :length => { in: 1..10 , message: "Debe tener entre 1 y 10 caracteres"},
                        :uniqueness => { :scope => :banco_id, message: "Este cheque ya existe en la base de datos" }
                        
  validates :banco_id, :presence => {:message => "Seleccione un banco"}

  validates :cliente_id, :presence => {:message => "Seleccione un cliente"}

  validates :monto, :presence => {:message => "No puede estar en blanco"},
  				    :numericality => {:only_double => true,:greater_than => 0, :message => "Debe ser un numero"}

  def name_cheque_recibido
		"#{nro_cheque} - #{monto}"
  end
  
end
