class User < ApplicationRecord
  attr_accessor :password, :password_confirmation
  before_save :hash_password
  validates :password, confirmation: {case_sensitive: false}

  def hash_password
    if password.present?
      self.password_hash = BCrypt::Password.create(password)
    end
  end


end
