class BoletaDeposito < ActiveRecord::Base
  belongs_to :cuentum
  belongs_to :caja
  belongs_to :cheque_recibido
  
end
