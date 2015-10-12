class ChequeEmitido < ActiveRecord::Base
  belongs_to :chequera
  belongs_to :cuentum, :through => :chequeras
end
