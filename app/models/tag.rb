class Tag < ActiveRecord::Base
  has_many :article_tags
  has_many :articles, through: :article_tags
  #validates :title, uniqueness: true

  def to_s
    title
  end

end
