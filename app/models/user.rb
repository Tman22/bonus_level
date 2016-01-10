class User < ActiveRecord::Base
  has_secure_password
  validates :name, presence: true, uniqueness: true
  validates :image_path, presence: true
  validates :password, presence: true
  has_many :articles
  enum role: %w(default admin)
  # has_many :authored_articles, class_name: "Article", foreign_key: "author_id"
  # has_many :likes
  # has_many :articles, through: :likes

  def owns?(article)
    self.id == article.user_id
  end
end
