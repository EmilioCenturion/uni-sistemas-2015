class ChequeEmitido < ActiveRecord::Base
  belongs_to :chequera
  belongs_to :proveedor
end
