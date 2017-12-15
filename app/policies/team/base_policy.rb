class Team::BasePolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    user.present?
  end

  def update?
    scope.where(id: record.id).exists? && is_owner?
  end

  def destroy?
    scope.where(id: record.id).exists? && is_owner?
  end

  class Scope < Scope
    def resolve
      scope
    end
  end

  private
    def is_owner?
      user && user == record.owner
    end
end
