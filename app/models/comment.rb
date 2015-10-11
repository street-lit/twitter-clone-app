class Comment < ActiveRecord::Base
  belongs_to :tweet
  validates :body, length: { minimum: 1 }
end
