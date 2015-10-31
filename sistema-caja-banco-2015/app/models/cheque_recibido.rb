class ChequeRecibido < ActiveRecord::Base
  belongs_to :banco
  belongs_to :cliente
  belongs_to :boleta_deposito_detalle
  
end
