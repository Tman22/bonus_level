class Article < ActiveRecord::Base
  validates :title, presence: true
  validates :article_image, presence: true
  validates :body, presence: true

  belongs_to :user
  has_many :article_tags
  has_many :tags, through: :article_tags
end
