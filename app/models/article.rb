class Article < ActiveRecord::Base
  before_save :default_values

  private

  def default_values
    self.number_of_views ||= 0;
  end
end
