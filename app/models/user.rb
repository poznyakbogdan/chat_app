class User < ApplicationRecord
  has_secure_password
  before_save :encrypted_password

  has_many :messages
  has_and_belongs_to_many :conversations

  validates :name, :presence => true
  validates :email, :presence => true
  validates :email, :uniqueness => true
  validates :password, :confirmation => true

  def encrypted_password
    if password.present?
      self.password_digest = BCrypt::Password.create password
    end
  end


end
