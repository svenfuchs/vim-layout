require File.expand_path('../../test_helper', __FILE__)

class MockWindowTest < Test::Unit::TestCase
  attr_reader :window

  def setup
    @window = Window.new
  end

  def teardown
    Window.clear
  end

  test 'Window.current returns the current window object' do
    assert Window.current.is_a?(Window)
  end

  test 'Window.count returns the number of windows' do
    assert_equal 1, Window.count
  end

  test 'Window[{n}] returns the window object for the number {n}. the first number is 0' do
    assert Window[0].is_a?(Window)
  end

  test 'window.buffer returns the buffer displayed in the window' do
    assert window.buffer.is_a?(Buffer)
  end

  test 'window.height returns the height of the window' do
    assert 80, window.height
  end

  test 'window.height= sets the window height to {n}' do
    window.height = 99
    assert 99, window.height
  end

  test 'window.width returns the width of the window' do
    assert 300, window.width
  end

  test 'window.width= sets the window width to {n}' do
    window.width = 400
    assert 400, window.width
  end

  test 'window.cursor returns a [row, col] array for the cursor position' do
    assert [1, 1], window.cursor
  end

  test 'window.cursor= sets the cursor position to {row} and {col}' do
    window.cursor = [2, 2]
    assert [2, 2], window.cursor
  end
end
