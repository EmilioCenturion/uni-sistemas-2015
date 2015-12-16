class MovimientoCaja < ActiveRecord::Base
  audited
  belongs_to :apertura_caja
  belongs_to :motivo_movimiento_caja
  has_many :cheque_recibidos
  
  validates :motivo_movimiento_caja_id, :presence => {:message => "Seleccione un motivo"}

  validates :monto_efectivo,  :presence => {:message => "No puede estar en blanco"},
                            
                              :numericality => {:only_double => true , :greater_than_or_equal_to => 0, :message => "Debe ser un numero"}

  accepts_nested_attributes_for :cheque_recibidos, allow_destroy: true

  before_create :bc_movimiento
  after_create :ac_movimiento

  validate :no_cero


  protected

		#validate :saldo_mayor

	    def no_cero
		    errors.add(:monto_efectivo, "no puede ser cero") if cheques_vacio? and monto_efectivo == 0
		end

	    def cheques_vacio?
	    	cheque_recibidos.empty?
	    end


      #  def saldo_mayor
      #   saldo = AperturaCaja.find(self.apertura_caja_id).saldo_final_efectivo + AperturaCaja.find(self.apertura_caja_id).saldo_final_cheque
      #   monto_total = monto_efectivo + monto_cheque
      #   errors.add(:monto_efectivo, "El monto del movimiento supera al monto total en caja") if es_ingreso == false and monto_total > saldo
      # end


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
