class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  scope :excluding_archived, lambda { where(archived_at: nil)}
  # Override the to_s on the User model to provide a string containing 
  # the email and admin status of the user.
  def to_s
    "#{email} (#{admin? ? "Admin" : "User"})"
  end 
  def archive
    self.update(archived_at: Time.now)
  end
end
