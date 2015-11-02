class CuponEmitido < ActiveRecord::Base
  belongs_to :tarjeta
  belongs_to :proveedor


 	validates :tarjeta_id, :presence => {:message => "Seleccione una tarjeta"}

 	validates :proveedor_id, :presence => {:message => "Seleccione un proveedor"}

	validates :nro_cupon, :presence => {:message => "No puede estar en blanco"},
			  :numericality => {:only_integer => true, :message => "Debe ser un numero"}

			  		   
	validates :monto, 
					   :presence => {:message => "No puede estar en blanco"},
					   :numericality => {:only_integer => true, :message => "Debe ser un numero"},
					   :format => {:multiline => true, with: /^\d*$/, message: 'No puede ser negativo'}
						



	validates :concepto, :presence => {:message => "No puede estar en blanco"},
						 :length => {in: 6..30, :message => "Debe tener entre 6 y 30 caracteres"}
			  		     
end
