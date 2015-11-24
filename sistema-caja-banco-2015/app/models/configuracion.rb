class Configuracion < ActiveRecord::Base
	mount_uploader :logo_empresa, LogoEmpresaUploader
	mount_uploader :cabecera_impresion, CabeceraImpresionUploader

 validates :tiempo_espera, :presence => {:message => "No puede estar en blanco"},
	 :numericality => {:only_double => true, :greater_than_or_equal_to => 0, :greater_than => 0, :message => "Debe ser un numero"}


	validates :correo, :presence => {:message => "No puede estar en blanco"},
					   :email_format => true

	validates :nombre_empresa, :direccion, :telefono,  :presence => {:message => "No puede estar en blanco"}

	validates :telefono, :format => { :multiline => true, with: /^([0-9])*$/, message: "Solo permite numeros"}
end
