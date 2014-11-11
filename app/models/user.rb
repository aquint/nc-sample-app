class User < ActiveRecord::Base
	attr_accessor :remember_token
	before_save { self.email = email.downcase }
	validates :name, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 },
	                  format: { with: VALID_EMAIL_REGEX },
	                  uniqueness: { case_sensitive: false }
	has_secure_password
	validates :password, length: { minimum: 8 }
	has_many :memberships
	has_many :teams, through: :memberships
  has_many :tasks
  has_many :items, through: :tasks

	def User.new_token
      SecureRandom.urlsafe_base64
  end
  
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

	def remember
	  self.remember_token = User.new_token
	  update_attribute(:remember_digest, User.digest(remember_token))
	end

  def authenticated?(remember_token)
  		return false if remember_digest.nil?
      BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  def join_team(team)
  	memberships.create(team_id: team.id)
  end
  def leave_team(team)
  	memberships.find_by(team_id: team.id).destroy
  end

  def in_team?(team)
	  teams.include?(team)
	end

  def self.search(query)
      if query
        query = "%" + query.downcase + "%"
          where('LOWER(email) LIKE ?', query)
      else
          scoped
      end
  end
end
