class User < ActiveRecord::Base
  has_secure_password
  validates :name, presence: true, uniqueness: true
  validates :image_path, presence: true
  validates :password, presence: true

  enum role: %w(default admin)

end