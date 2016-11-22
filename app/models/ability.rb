class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new
    case
    when user.admin?
      can :manage, :all
    when user.user?
      can :manage, :all
    else
      can :read, :all
    end
  end
end
