class HeadlineEntry < ActiveRecord::Base
  validates_uniqueness_of :link
  class << self
    def recent(limit=5)
      self.find(:all, :order => 'time DESC', :limit => limit)
    end
  end
end
