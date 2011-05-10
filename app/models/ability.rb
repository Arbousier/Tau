class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.is_admin?(user)
      can :manage, :all
    end

    if user.is_guest?(user)
      can [:create], Subscriber
      can [:read], Post
    end
  end
end