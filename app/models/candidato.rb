class Candidato < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  
  belongs_to :post

  validates :name, :length => { :minimum => 2 }
  validates :name, :length => { :maximum => 50 }
   
  validates :email, :length => { :minimum => 5 }
  validates :email, :length => { :maximum => 200}

  validates :urllinkedin, :length => { :minimum => 16 }
  validates :urllinkedin, :length => { :maximum => 100}
 
end
