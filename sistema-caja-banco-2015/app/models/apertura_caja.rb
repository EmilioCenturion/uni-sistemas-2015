class AperturaCaja < ActiveRecord::Base
  belongs_to :caja
  belongs_to :user
  has_many :movimiento_cajas
  has_many :boleta_depositos

  validates :caja_id, :presence => {:message => "Debe seleccionar una caja"}

  before_create :create_apertura


	protected
		def create_apertura
			caja = Caja.find(self.caja_id)
			self.saldo_inicial_cheque = caja.saldo_inicial_cheque
			self.saldo_final_cheque = caja.saldo_inicial_cheque
			self.saldo_inicial_efectivo = caja.saldo_inicial_efectivo
			self.saldo_final_efectivo = caja.saldo_inicial_efectivo
			self.apertura = Time.now
			Caja.update(caja, :estado => 'Abierto')
		end
end
