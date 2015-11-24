class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)
        if user.has_role? :administrador
            can :manage, :all

        #Roles para Banco
        elsif user.has_role? :crear_banco
            can :create, Banco
            can :read, Banco
        elsif user.has_role? :eliminar_banco
            can :destroy, Banco
            can :read, Banco
        elsif user.has_role? :editar_banco
            can :edit, Banco
            can :read, Banco
        elsif user.has_role? :ver_banco
            can :read, Banco
        
        #Roles para Caja
        elsif user.has_role? :crear_caja
            can :create, Caja
            can :read, Caja
        elsif user.has_role? :ver_caja
            can :read, Caja

        #Roles Apertura Caja
        elsif user.has_role? :crear_apertura
            can :create, AperturaCaja
            can :read, AperturaCaja
            can :create, MovimientoCaja
            can :read, MovimientoCaja
            can :create, BoletaDeposito
            can :read, BoletaDeposito
        elsif user.has_role? :ver_apertura
            can :read, AperturaCaja
            can :read, MovimientoCaja
            can :read, BoletaDeposito

        #Roles para Cuentas
        elsif user.has_role? :crear_cuenta
            can :create, Cuentum
            can :read, Cuentum
        elsif user.has_role? :eliminar_cuenta
            can :destroy, Cuentum
            can :read, Cuentum
        elsif user.has_role? :editar_cuenta
            can :edit, Cuentum
            can :read, Cuentum
        elsif user.has_role? :ver_cuenta
            can :read, Cuentum

        #Roles para Tarjetas
        elsif user.has_role? :crear_tarjeta
            can :create, Credit
            can :read, Credit
        elsif user.has_role? :eliminar_tarjeta
            can :destroy, Credit
            can :read, Credit
        elsif user.has_role? :editar_tarjeta
            can :edit, Credit
            can :read, Credit
        elsif user.has_role? :ver_tarjeta
            can :read, Credit

        #Roles para Chequeras
        elsif user.has_role? :crear_chequera
            can :create, Chequera
            can :read, Chequera
        elsif user.has_role? :eliminar_chequera
            can :destroy, Chequera
            can :read, Chequera
        elsif user.has_role? :editar_chequera
            can :edit, Chequera
            can :read, Chequera
        elsif user.has_role? :ver_chequera
            can :read, Chequera

        #Roles para Movimiento Banco
        elsif user.has_role? :crear_movimiento_banco
            can :create, MovimientoBanco
            can :read, MovimientoBanco
        elsif user.has_role? :ver_movimiento_banco
            can :read, MovimientoBanco

        #Roles para Auditoria
        elsif user.has_role? :auditar
            can :manage, AuditoriaLog
         
        else
            can :read, :all
        end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end

