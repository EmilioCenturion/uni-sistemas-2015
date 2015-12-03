class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  audited except: :encrypted_password
  has_many :apertura_cajas
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    ROLES = %i[administrador crear_banco eliminar_banco editar_banco ver_banco crear_caja ver_caja crear_apertura ver_apertura crear_cuenta eliminar_cuenta editar_cuenta ver_cuenta crear_tarjeta eliminar_tarjeta editar_tarjeta ver_tarjeta crear_chequera eliminar_chequera editar_chequera ver_chequera crear_movimiento_banco ver_movimiento_banco auditar libro_banco]

  validates :username, :apellido,  :presence => {:message => "No puede estar en blanco"},
                                   :format => {with: /[a-zA-ZÃ�ï¿½Ã�Â±Ã�Â¡Ã�Â©Ã�Â­Ã�Â³Ã�Âº]/, message: 'Solo permite letras'}

  validates :numero_ci, :telefono, :celular,   :presence => {:message => "No puede estar en blanco"},
                          :format => { :multiline => true, with: /^([0-9])*$/, message: "Solo permite numeros"}      

  validates :direccion, :presence => {:message => "No puede estar en blanco"}

 # validates :pai_id, :presence => {:message => "Tienes que seleccionar un pais"}
  
 # validates :ciudad_id, :presence => {:message => "Tienes que seleccionar una ciudad"}

  validates :email, presence: true, on: :create

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
