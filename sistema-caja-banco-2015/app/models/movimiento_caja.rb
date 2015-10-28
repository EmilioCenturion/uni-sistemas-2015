class MovimientoCaja < ActiveRecord::Base
  belongs_to :apertura_caja
  belongs_to :motivo_movimiento_caja
end
