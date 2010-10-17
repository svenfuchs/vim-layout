$:.unshift File.expand_path('../../lib', __FILE__)
$:.unshift File.expand_path('..', __FILE__)

require 'rubygems'
require 'test/unit'
require 'mocha'
require 'test_declarative'
require 'vim'
require 'mocks'
include Mocks

class Test::Unit::TestCase
  Window.send(:include, Vim::Window)

  def teardown
    Window.reset
  end
end
