class History < ActiveRecord::Base
  attr_accessible :action, :devise_id, :level, :status, :percentage
  belongs_to :devise
  
  validates :level, :numericality => {:less_than_or_equal_to => 255, :greater_than_or_equal_to => 0}, :presence => true
  validates :action, :devise_id, :presence => true
  
  before_save :convert_level_to_percentage
  
  def convert_level_to_percentage
    self.percentage = (self.level / 255.0) * 100
  end
end
