class BookmarkPolicy < ApplicationPolicy
  def index?
    true
  end

  def update?
    user.present? && (record.user == user)
  end

  def update?
    create?
  end

  def destroy?
    update?
  end
end

