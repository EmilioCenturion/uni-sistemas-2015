class BoletaDeposito < ActiveRecord::Base
  belongs_to :cuenta
  belongs_to :apertura_caja
end
