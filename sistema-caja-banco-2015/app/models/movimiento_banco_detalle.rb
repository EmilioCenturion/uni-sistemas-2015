class MovimientoBancoDetalle < ActiveRecord::Base
  audited
  belongs_to :movimiento_banco
  belongs_to :cheque_recibido

end
