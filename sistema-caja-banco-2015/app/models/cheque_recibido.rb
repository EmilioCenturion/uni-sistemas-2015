class ChequeRecibido < ActiveRecord::Base
  belongs_to :banco
  belongs_to :cliente
  belongs_to :movimiento_caja

  def name_cheque_recibido
		"#{nro_cheque} - #{monto}"
  end
  
end
