class LikePolicy < ApplicationPolicy
  def destroy?
    update?
  end
end

