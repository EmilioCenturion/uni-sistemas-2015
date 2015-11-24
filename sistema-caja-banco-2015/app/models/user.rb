class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  audited except: :encrypted_password
  has_many :apertura_cajas
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    ROLES = %i[administrador crear_banco eliminar_banco editar_banco ver_banco crear_caja ver_caja crear_apertura ver_apertura crear_cuenta eliminar_cuenta editar_cuenta ver_cuenta crear_tarjeta eliminar_tarjeta editar_tarjeta ver_tarjeta crear_chequera eliminar_chequera editar_chequera ver_chequera crear_movimiento_banco ver_movimiento_banco auditar]

  	def roles=(roles)
    	roles = [*roles].map { |r| r.to_sym }
    	self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
  	end

  	def roles
    	ROLES.reject do |r|
      	((roles_mask.to_i || 0) & 2**ROLES.index(r)).zero?
    	end
  	end

  	def has_role?(role)
    	roles.include?(role)
  	end
end
