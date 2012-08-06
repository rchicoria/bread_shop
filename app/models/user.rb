class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  # These attributes cannot be null
  validates_presence_of :fullname, :username, :password
  validates_presence_of :phone_number, :if => :is_customer?
  validate :roles_presence

  # Custom validation methods

  # Check if the user has, at least, one role
  def roles_presence
    if roles.size == 0
      errors.add(:roles, "User must have, at least, one role")
    end
  end

  # Database relations
  has_and_belongs_to_many :roles

  # Check if user has a given role
  def role?(role)
    return !!self.roles.find_by_name(role.to_s)
  end

  def is_customer?
    return !!self.roles.find_by_name('customer')
  end

  def role=(role)
    roles.clear
    role = Role.find_by_name(role.to_s)
    roles << role
  end
end
