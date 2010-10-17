require File.expand_path('../test_helper', __FILE__)

class WindowTest < Test::Unit::TestCase
  attr_reader :windows

  def setup
    @windows = [Window.new('foo'), Window.new('bar'), Window.new('baz')]
    $curwin = windows.first
  end

  test 'Window.each' do
    actual = []
    Window.each { |window| actual << window }
    assert_equal windows, actual
  end

  test 'Window.map (i.e. enumerable works)' do
    buffers = [Window[0].buffer, Window[1].buffer, Window[2].buffer]
    assert_equal buffers, Window.map(&:buffer)
  end

  test 'Window.index finds the index of a window' do
    assert_equal 1, Window.index(windows[1])
  end

  test 'Window.find finds a window having a buffer that has the given file opened' do
    assert_equal windows[1], Window.find('bar')
  end

  test 'Window.open? returns true when there is a window having a buffer that has the given file opened' do
    assert Window.open?('bar')
    assert !Window.open?('buz')
  end

  test 'Window.previous! focusses the previous window' do
    VIM.expects(:command).with('set eventignore=all')
    VIM.expects(:command).with('wincmd p')
    VIM.expects(:command).with('set eventignore=')
    Window.previous!
  end

  test 'Window.previous returns the previous window' do
  end

  test 'window.index returns the index of the window (zero based)' do
    assert_equal 1, windows[1].index
  end

  test 'window.number returns the index of the window (one based)' do
    assert_equal 2, windows[1].number
  end
end
