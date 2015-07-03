class BookmarkPolicy < ApplicationPolicy
  def index?
    true
  end

  def update?
    user.present? && (record.topic.user == user)
  end

  def destroy?
    update?
  end
end

