class MovimientoBanco < ActiveRecord::Base
  belongs_to :cuenta
  belongs_to :motivo_movimiento_banco
end
