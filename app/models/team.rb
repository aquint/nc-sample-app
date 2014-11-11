class Team < ActiveRecord::Base
	validates :name, presence: true, length: { maximum: 255 },
	                 uniqueness: { case_sensitive: false }
	has_many :memberships
	has_many :users, :through => :memberships

end
