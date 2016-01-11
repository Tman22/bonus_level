class Tag < ActiveRecord::Base
  has_many :article_tags, dependent: :destroy
  has_many :articles, through: :article_tags

  def to_s
    title
  end

end
