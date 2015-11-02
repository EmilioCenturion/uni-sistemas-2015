class MovimientoBancoDetalle < ActiveRecord::Base
  belongs_to :movimiento_banco
  belongs_to :cheque_recibido

end
