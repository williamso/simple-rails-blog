class Post < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  
  has_many :candidatos
  
  validates :title, :length => { :minimum => 2 }
  validates :title, :length => { :maximum => 50 }
  
  validates :name, :length => { :minimum => 2 }
  validates :name, :length => { :maximum => 50 }
  
  validates :body, :length => { :minimum => 15 }
  validates :body, :length => { :maximum => 1500}
  
  validates :email, :length => { :minimum => 5 }
  validates :email, :length => { :maximum => 200}
  
  paginates_per 5
  
  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
#    where("status = true and title like ?", "%#{query}%") 
    where(" title like ?", "%#{query}%") 
  end
  
end
