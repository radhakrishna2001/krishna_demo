class CompanyPolicy < ApplicationPolicy
  #class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
     

    def create?
      user.admin?
    end
         

    def edit?
      user.admin?
    end

    def update?
      user.admin?
    end

    
  end
#end
