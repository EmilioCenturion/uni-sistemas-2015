class BoletaDepositoDetalle < ActiveRecord::Base
  belongs_to :boleta_deposito
  has_one :cheque_recibido	

  validates :cheque_recibido_id, :presence => {:message => "Seleccione un cheque"}
end
