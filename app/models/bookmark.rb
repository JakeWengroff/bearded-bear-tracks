class Bookmark < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user

  validates_presence_of :topic
  validates_presence_of :url
end
