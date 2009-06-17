class Talk < ActiveRecord::Base
  
  #
  # named scopes
  #
  named_scope :year, Proc.new { |year| { :conditions => [ "year = ?", year ] } }
end
