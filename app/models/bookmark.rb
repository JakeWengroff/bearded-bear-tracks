class Bookmark < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user

  validates_presence_of :topic
  validates_presence_of :url

  has_many :likes, dependent: :destroy

  
  scope :visible_to, -> (user) { user ? all : joins(:bookmark).where('bookmarks.public' => true) }
end
