class MovimientoBanco < ActiveRecord::Base
  belongs_to :cuentum
  belongs_to :motivo_movimiento_banco




  before_create :create_movimiento

  protected
  def create_movimiento
  	self.fecha = Time.now
  	saldo = Cuentum.find(self.cuenta_id).saldo
  	if self.es_ingreso
  		saldo= saldo + self.monto_efectivo + self.monto_cheque
  	else
  		saldo= saldo - self.monto_efectivo - self.monto_cheque
  	end
  	Cuentum.update(self.cuenta_id, :saldo => saldo)
  end
end
