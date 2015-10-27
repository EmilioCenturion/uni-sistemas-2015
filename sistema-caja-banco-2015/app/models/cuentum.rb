class Cuentum < ActiveRecord::Base
  belongs_to :banco
  has_many :credits
  has_many :cupon_emitidos, :through => :credits
  has_many :chequeras
  has_many :cheque_emitidos, :through => :chequeras
  has_many :movimiento_bancos
  has_many :boleta_depositos
end
