class BoletaDepositoDetalle < ActiveRecord::Base
  belongs_to :boleta_deposito
  has_one :cheque_recibido	
end
