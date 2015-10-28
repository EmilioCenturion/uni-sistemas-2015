class MovimientoCajaDetalle < ActiveRecord::Base
  belongs_to :movimiento_caja
  belongs_to :cheque_recibido
end
