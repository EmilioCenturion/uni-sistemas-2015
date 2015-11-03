class CuponEmitido < ActiveRecord::Base
  belongs_to :tarjeta
  belongs_to :proveedor


 	validates :tarjeta_id, :presence => {:message => "Seleccione una tarjeta"}

 	validates :proveedor_id, :presence => {:message => "Seleccione un proveedor"}

	validates :nro_cupon, :presence => {:message => "No puede estar en blanco"},
			  :numericality => {:only_integer => true, :message => "Debe ser un numero"}

			  		   
	validates :monto, 
					   :presence => {:message => "No puede estar en blanco"},
					   :numericality => {:only_double => true, :message => "Debe ser un numero"}
						



	validates :concepto, :presence => {:message => "No puede estar en blanco"},
						 :length => {in: 6..30, :message => "Debe tener entre 6 y 30 caracteres"}

	before_create :bc_cupon
	
	protected
  	def bc_cupon
  		motivo = MotivoMovimientoBanco.find_by(:descripcion => 'Pago a proveedores')
  		credito = Credit.find(self.tarjeta_id)
  		if motivo.nil? 
  			motivo = MotivoMovimientoBanco.create(:descripcion => 'Pago a proveedores')
  		end

  		MovimientoBanco.create(:cuenta_id => credito.cuentum_id, :motivo_movimiento_banco_id => motivo.id, :descripcion => self.concepto, :es_ingreso => false, :monto_efectivo => 0, :monto_cheque => self.monto, :fecha => Time.now)

  	end
			  		     
end
