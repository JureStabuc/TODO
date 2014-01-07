class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :todo_lists
  has_many :todo_items
  has_many :user_friendships
  has_many :friends, through: :user_friendships

  validates :first_name, presence: true

  validates :last_name, presence: true

  validates :profile_name, presence: true,
                           uniqueness: true,
                           format: {
                           with: /\A[a-zA-Z0-9_-]+\z/,
                           message: 'Must be formatted correctly.'
                            }

	def full_name
	    first_name + " " + last_name
	end

  def to_param
    profile_name    
  end

end
