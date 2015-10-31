class BoletaDeposito < ActiveRecord::Base
  belongs_to :cuentum
  belongs_to :apertura_caja
  has_many :boleta_deposito_detalles
end
