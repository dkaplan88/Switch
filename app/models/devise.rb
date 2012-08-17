class Devise < ActiveRecord::Base
  attr_accessible :name
  has_many :histories
end
