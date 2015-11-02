class ChequeEmitido < ActiveRecord::Base
  belongs_to :chequera
  belongs_to :proveedor

 	validates :chequera_id, :presence => {:message => "Seleccione una chequera"}

	validates :nro_cheque, :presence => {:message => "No puede estar en blanco"},
			  :numericality => {:only_integer => true, :message => "Debe ser un numero"}

			  		   
	validates :monto, 
					   :presence => {:message => "No puede estar en blanco"},
					   :numericality => {:only_integer => true, :message => "Debe ser un numero"},
					   :format => {:multiline => true, with: /^\d*$/, message: 'No puede ser negativo'}
						



	validates :concepto, :presence => {:message => "No puede estar en blanco"},
						 :length => {in: 6..30, :message => "Debe estar entre 6 y 30 caracteres"}
			  		     

	 validates :proveedor_id, :presence => {:message => "Seleccione un proveedor"}
	
	
end
