class Article < ActiveRecord::Base
  include StringOpsHelper
  MAX_PREVIEW_LENGTH = 1000

  before_save :default_values
  validates :title, presence: true
  validates :content, presence: true

  has_many :comments, dependent: :destroy

  # attr_accessor :preview, :preview_paragraphs, :truncate, :paragraphs;

  def preview
    return self.content[0...MAX_PREVIEW_LENGTH]
  end

  def preview_paragraphs
    return splitByNewline(self.content)
  end

  def truncate
    return self.preview.length != self.content.length
  end

  def paragraphs
    return splitByNewline self.content
  end

  private

  def default_values
    self.number_of_views ||= 0;
  end
end
