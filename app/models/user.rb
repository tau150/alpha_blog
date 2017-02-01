class User < ActiveRecord::Base

  validates :username, presence: true, 
            uniqueness: { case_sensitive: false},
            length: { minumun: 3, maximum: 25}

 VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i 
 validate :email, presence:true,
          length: { maximum: 105}
          uniqueness: { case_sensitive: false},
          format: { with: VALID_EMAIL_REGEX}
end