class BoletaDeposito < ActiveRecord::Base
  belongs_to :cuentum
  belongs_to :apertura_caja
  has_many :boleta_deposito_detalles
  accepts_nested_attributes_for :boleta_deposito_detalles, allow_destroy: true
end
