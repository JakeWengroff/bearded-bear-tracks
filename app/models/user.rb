class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :topics, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :likes, dependent: :destroy

  def liked(bookmark)
    likes.where(bookmark_id: bookmark.id).first
  end

  def created_bookmarks
    bookmarks.includes(:topic)
  end

  def liked_bookmarks
    likes.includes(bookmark: :topic).map(&:bookmark)
  end
end
