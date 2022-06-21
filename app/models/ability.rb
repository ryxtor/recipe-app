# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :read, :all
    can :manage, Inventory, user_id: user.id

    return unless user.role.eql? 'admin'

    can :manage, :all
  end
end
