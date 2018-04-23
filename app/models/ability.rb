class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    can :manage, User, id: user.id
    can :read, Product
    if user.admin?
      can :destroy, Comment
      can :manage, User
      can :manage, Product
      can :manage, Order
    end
  end
end
