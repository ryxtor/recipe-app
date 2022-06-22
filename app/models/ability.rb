class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :read, :all
    can :read, Inventory, user_id: user.id
    can :manage, Recipe, user_id: user.id
    can :manage, Inventory, user_id: user.id

    return unless user.role.eql? 'admin'

    can :manage, :all
  end
end
