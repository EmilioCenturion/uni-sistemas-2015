class CuponEmitido < ActiveRecord::Base
  belongs_to :tarjeta
  belongs_to :proveedor
end
