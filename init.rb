# Include hook code here
require 'validates_email_address'

ActiveRecord::Base.send :include, ValidatesEmailAddress 
