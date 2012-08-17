class History < ActiveRecord::Base
  attr_accessible :action, :devise_id, :level, :status
  belongs_to :devise
  

   def self.total_on
     self.all.each do |x|
       x.level
       x.created_at
     end
   end
end
