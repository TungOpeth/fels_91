class Ability
  include CanCan::Ability

  def initialize(user)
    # user ||= User.new # guest user (not logged in)
    # if user.supervisor?
    #   can :manage, :all
    # else
    #   can :read, :all
    # end
    can :manage, :all
  end
end
