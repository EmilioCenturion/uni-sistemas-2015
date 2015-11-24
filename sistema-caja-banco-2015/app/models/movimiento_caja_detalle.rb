class MovimientoCajaDetalle < ActiveRecord::Base
  audited
  belongs_to :movimiento_caja
  belongs_to :cheque_recibido
end
