require File.expand_path('../../test_helper', __FILE__)

class MockBufferTest < Test::Unit::TestCase
  attr_reader :buffer

  def setup
    @buffer = Window.new.buffer
  end

  test 'Buffer.current returns the current buffer object' do
    assert Buffer.current.is_a?(Buffer)
  end

  test 'Buffer.count returns the number of buffers' do
    assert_equal 1, Buffer.count
  end

  test 'Buffer[{n}] returns the buffer object for the number {n}. the first number is 0' do
    assert Buffer[0].is_a?(Buffer)
  end

  test 'buffer.number returns the number of the buffer' do
    assert_equal 1, buffer.number
  end

  test 'buffer.count returns the number of lines' do
    assert_equal 1, buffer.count
  end

  test 'buffer.length returns the number of lines' do
    assert_equal 1, buffer.length
  end

  test 'buffer[{n}] returns a line from the buffer. {n} is the line number' do
    assert_equal '', buffer[1]
  end

  test 'buffer[{n}]= sets a line in the buffer. {n} is the line number' do
    buffer[1] = 'foo'
    assert_equal 'foo', buffer[1]
  end

  test 'buffer.delete({n}) deletes a line from the buffer. {n} is the line number' do
    buffer[2] = 'bar'
    assert_equal 2, buffer.length
    buffer.delete(2)
    assert_equal 1, buffer.length
  end

  test 'buffer.append({n}, {str}) appends a line after the line {n}' do
    buffer[2] = 'foo'
    buffer.append(2, 'bar')
    assert_equal 'bar', buffer[3]
  end

  test 'buffer.line returns the current line of the buffer if the buffer is active' do
    buffer[1] = 'foo'
    assert_equal 'foo', buffer.line
  end

  test 'buffer.line= sets the current line of the buffer if the buffer is active' do
    buffer.line = 'bar'
    assert_equal 'bar', buffer.line
  end

  test 'buffer.line_number returns the number of the current line if the buffer is active (first line is 1)' do
    assert_equal 1, buffer.line_number
  end
end
