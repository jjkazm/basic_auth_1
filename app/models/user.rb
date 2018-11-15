class User < ApplicationRecord
  attr_accessor :password, :password_confirmation
  before_save :hash_password
  validates :password, confirmation: {case_sensitive: true}
  validates :email, presence: true, uniqueness: {case_sensitive: false}


  def hash_password
    if password.present?
      self.password_hash = BCrypt::Password.create(password)
    end
  end

  def self.check(email, password)
    user = User.find_by(email: email)
    if user && BCrypt::Password.new(user.password_hash) == password
      user
    else
      nil
    end
  end


end
