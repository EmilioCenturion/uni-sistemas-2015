class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)
        
        #Administrador
        if user.has_role? :administrador
            can :manage, :all
        end

        #Roles para Banco
        if user.has_role? :crear_banco
            can :create, Banco
            can :read, Banco
        end

        if user.has_role? :eliminar_banco
            can :destroy, Banco
            can :read, Banco
        end

        if user.has_role? :editar_banco
            can :edit, Banco
            can :read, Banco
        end
        if user.has_role? :ver_banco
            can :read, Banco
        end

        #Roles para Caja
        if user.has_role? :crear_caja
            can :create, Caja
            can :read, Caja
        end

        if user.has_role? :ver_caja
            can :read, Caja
        end

        #Roles Apertura Caja
        if user.has_role? :crear_apertura
            can :create, AperturaCaja
            can :read, AperturaCaja
            can :create, MovimientoCaja
            can :read, MovimientoCaja
            can :create, BoletaDeposito
            can :read, BoletaDeposito
        end

        #Roles para Cuentas
        if user.has_role? :crear_cuenta
            can :create, Cuentum
            can :read, Cuentum
        end

        if user.has_role? :eliminar_cuenta
            can :destroy, Cuentum
            can :read, Cuentum
        end

        if user.has_role? :editar_cuenta
            can :edit, Cuentum
            can :read, Cuentum
        end

        if user.has_role? :ver_cuenta
            can :read, Cuentum
        end

        #Roles para Tarjetas
        if user.has_role? :crear_tarjeta
            can :create, Credit
            can :read, Credit
            can :read, Cuentum
        end

        if user.has_role? :eliminar_tarjeta
            can :destroy, Credit
            can :read, Credit
            can :read, Cuentum
        end

        if user.has_role? :editar_tarjeta
            can :edit, Credit
            can :read, Credit
            can :read, Cuentum
        end

        if user.has_role? :ver_tarjeta
            can :read, Credit
            can :read, Cuentum
        end

        #Roles para Chequeras
        if user.has_role? :crear_chequera
            can :create, Chequera
            can :read, Chequera
            can :read, Cuentum

        end

        if user.has_role? :eliminar_chequera
            can :destroy, Chequera
            can :read, Chequera
            can :read, Cuentum
        end

        if user.has_role? :editar_chequera
            can :edit, Chequera
            can :read, Chequera
            can :read, Cuentum
        end

        if user.has_role? :ver_chequera
            can :read, Chequera
            can :read, Cuentum
        end

        #Roles para Movimiento Banco
        if user.has_role? :crear_movimiento_banco
            can :create, MovimientoBanco
            can :read, MovimientoBanco
        end

        if user.has_role? :ver_movimiento_banco
            can :read, MovimientoBanco
        end

        #Roles para Auditoria
        if user.has_role? :auditar
            can :manage, Audited::Adapters::ActiveRecord::Audit
        end

        #Roles para Libro Banco
        if user.has_role? :libro_banco
            can :manage, LibroBanco
            can :read, LibroBanco
            can :create, LibroBanco
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

