require 'test/unit'
require File.dirname(__FILE__) + '/test_helper.rb'

class ConfigatronRailsTest < Test::Unit::TestCase
  def test_injection
    assert_respond_to configatron, :load_environment_settings
  end
end
