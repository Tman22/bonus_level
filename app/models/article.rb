class Article < ActiveRecord::Base
  validates :title, presence: true
  validates :article_image, presence: true
  validates :body, presence: true

  belongs_to :user
  has_many :article_tags
  has_many :tags, through: :article_tags

  def tag_list
    tags.join(", ")
  end

  def tag_list=(tag_string)
    tag_names = tag_string.split(",").collect{ |s| s.strip.capitalize }.uniq
    new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(title: name) }
    self.tags = new_or_found_tags
  end
end