$:.unshift File.expand_path('../../lib', __FILE__)
$:.unshift File.expand_path('..', __FILE__)

require 'rubygems'
require 'test/unit'
require 'mocha'
require 'test_declarative'
require 'vim/window'

class Test::Unit::TestCase
  autoload :Mocks, 'mocks'
  include Mocks
end

