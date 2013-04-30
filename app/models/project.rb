class Project < ActiveRecord::Base
  acts_as_taggable
  acts_as_commentable
  acts_as_voteable
  attr_accessible :address, :idea, :problem, :solution, :user_id, :zipcode, :tag_list
  belongs_to :user

  validates :user_id, presence: true
  validates :idea, presence: true
  validates :problem, presence: true
  validates :solution, presence: true
  
  default_scope order: 'projects.created_at DESC'

  def karma
    self.votes_for - self.votes_against
  end
end
