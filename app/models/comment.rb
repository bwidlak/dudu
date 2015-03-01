class Comment < ActiveRecord::Base
  validates_presence_of :body, :author
  scope :random, -> { limit(1).order("RANDOM()") }
end
