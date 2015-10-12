class Cuentum < ActiveRecord::Base
  belongs_to :banco
  has_many :credits
  has_many :cupon_emitidos, :through => :credits
  has_many :chequeras
  has_many :cheque_emitidos, :through => :chequeras
  has_many :movimiento_bancos
  has_many :boleta_depositos
  accepts_nested_attributes_for :credits, allow_destroy: true
  accepts_nested_attributes_for :chequeras, allow_destroy: true

end
