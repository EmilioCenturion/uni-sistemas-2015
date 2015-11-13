class MovimientoCaja < ActiveRecord::Base
  belongs_to :apertura_caja
  belongs_to :motivo_movimiento_caja
  has_many :cheque_recibidos
  
  validates :motivo_movimiento_caja_id, :presence => {:message => "Seleccione un motivo"}

  validates :monto_efectivo,  :presence => {:message => "No puede estar en blanco"},
                            
                              :numericality => {:only_double => true, :message => "Debe ser un numero"}

  accepts_nested_attributes_for :cheque_recibidos, allow_destroy: true

  before_create :bc_movimiento
  after_create :ac_movimiento

validate :no_cero

    def no_cero
    errors.add(:monto_efectivo, "no puede ser cero") if cheques_vacio?
  end

  def cheques_vacio?
    cheque_recibidos.empty?
  end


		def bc_movimiento
			self.fecha = Time.now
			if self.monto_cheque == 0 
				monto_cheque = 0
				self.cheque_recibidos.each do |cheque|
					monto_cheque = monto_cheque + cheque.monto
				end
				self.monto_cheque = monto_cheque 
			end
		end

		def ac_movimiento
			saldo_efectivo = self.apertura_caja.saldo_final_efectivo
			saldo_cheque = self.apertura_caja.saldo_final_cheque
			if self.es_ingreso 
				saldo_efectivo = saldo_efectivo + self.monto_efectivo
				saldo_cheque = saldo_cheque + self.monto_cheque
			else
				saldo_efectivo = saldo_efectivo - self.monto_efectivo
				saldo_cheque = saldo_cheque - self.monto_cheque
			end
			AperturaCaja.update(self.apertura_caja_id, saldo_final_efectivo: saldo_efectivo)
			AperturaCaja.update(self.apertura_caja_id, saldo_final_cheque: saldo_cheque)
		end
end
