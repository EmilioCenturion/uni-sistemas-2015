class BoletaDepositoDetalle < ActiveRecord::Base
  belongs_to :boleta_deposito
  belongs_to :cheque_recibido
end
