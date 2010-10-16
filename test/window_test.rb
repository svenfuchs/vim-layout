require File.expand_path('../test_helper', __FILE__)

class WindowTest < Test::Unit::TestCase
  attr_reader :window

  def setup
    @window = Mocks::Window.new
  end

  test '' do
    p window
  end
end
