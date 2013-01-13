class Post < ActiveRecord::Base
  attr_accessible :body, :name, :rating, :title
  
  validates :title, :length => { :minimum => 2 }
  validates :title, :length => { :maximum => 50 }
  
  validates :name, :length => { :minimum => 2 }
  validates :name, :length => { :maximum => 50 }
  
  validates :body, :length => { :minimum => 15 }
  validates :body, :length => { :maximum => 1500}
  
  validates :rating, :numericality => { :greater_than => 0 }
  validates :rating, :numericality => { :less_than => 10 }
  
end
