class ChequeEmitido < ActiveRecord::Base
  audited
  belongs_to :chequera
  belongs_to :proveedor

 	validates :chequera_id, :presence => {:message => "Seleccione una chequera"}

	validates :nro_cheque, :presence => {:message => "No puede estar en blanco"},
			  :numericality => {:only_integer => true, :greater_than_or_equal_to => 0, :message => "Debe ser un numero"}

			  		   
	validates :monto, 
					   :presence => {:message => "No puede estar en blanco"},
					   :numericality => {:only_double => true, :message => "Debe ser un numero"}						



	validates :concepto, :presence => {:message => "No puede estar en blanco"},
						 :length => {in: 4..30, :message => "Debe estar entre 4 y 30 caracteres"}
			  		     

	validates :proveedor_id, :presence => {:message => "Seleccione un proveedor"}

	before_create :bc_cheque
	
	protected
  	def bc_cheque
  		motivo = MotivoMovimientoBanco.find_by(:descripcion => 'Pago a proveedores')
  		if motivo.nil? 
  			motivo = MotivoMovimientoBanco.create(:descripcion => 'Pago a proveedores')
  		end
  		MovimientoBanco.create(:cuenta_id => self.chequera.cuentum_id, :motivo_movimiento_banco_id => motivo.id, :descripcion => self.concepto, :es_ingreso => false, :monto_efectivo => 0, :monto_cheque => self.monto, :fecha => Time.now)

  	end
	
end
