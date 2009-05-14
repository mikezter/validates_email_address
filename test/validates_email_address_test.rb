require 'test_helper'

class User < ActiveRecord::Base
  validates_email_address :email, 
    :message => 'my custom error message',
    :unless => :dont_validate

  attr_accessor :dont_validate
end

class ValidatesEmailAddressTest < ActiveSupport::TestCase
  test "valid email is accepted" do
    user = User.create( :email => 'valid@example.com', :name => 'Valid User')
    assert user.errors.empty?
    assert user.valid?
    
  end
  
  test "invalid email is rejected" do
    user = User.create(:email => 'invaläöid@email', :name => 'Invalid User')
    assert !user.errors.empty?
    assert !user.valid?
  end
  
  test "validation options are passed" do
    user = User.create(:email => 'invaläöid@email', :name => 'Invalid User')
    assert_equal 'my custom error message', user.errors.on(:email)
    
    user = User.new(:email => 'invaläöid@email', :name => 'Invalid User')
    user.dont_validate = true
    user.save
    assert user.errors.empty?
    assert user.valid?
  end
  
end
