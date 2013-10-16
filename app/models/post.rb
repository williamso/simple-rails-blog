class Post < ActiveRecord::Base
  attr_accessible :body, :name, :email, :title
  
  validates :title, :length => { :minimum => 2 }
  validates :title, :length => { :maximum => 50 }
  
  validates :name, :length => { :minimum => 2 }
  validates :name, :length => { :maximum => 50 }
  
  validates :body, :length => { :minimum => 15 }
  validates :body, :length => { :maximum => 1500}
  
  validates :email, :length => { :minimum => 5 }
  validates :email, :length => { :maximum => 200}
  
  paginates_per 5
  
end
