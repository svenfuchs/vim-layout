# VIM::Buffer objects represent vim buffers.
#
# Class Methods:
#
# current		         Returns the current buffer object.
# count		           Returns the number of buffers.
# self[{n}]	         Returns the buffer object for the number {n}.  The first number is 0.
#
# Methods:
#
# name		           Returns the name of the buffer.
# number	           Returns the number of the buffer.
# count		           Returns the number of lines.
# length	           Returns the number of lines.
# self[{n}]          Returns a line from the buffer. {n} is the line number.
# self[{n}] = {str}  Sets a line in the buffer. {n} is the line number.
# delete({n})        Deletes a line from the buffer. {n} is the line number.
# append({n}, {str}) Appends a line after the line {n}.
# line		           Returns the current line of the buffer if the buffer is active.
# line = {str}       Sets the current line of the buffer if the buffer is active.
# line_number        Returns the number of the current line if the buffer is active.

module Mocks
  class Buffer
    class << self
      def [](ix)
        buffers[ix]
      end

      def current
        Window.current.buffer
      end

      def count
        buffers.size
      end

      protected

        def buffers
          Window.send(:windows).map(&:buffer)
        end
    end

    attr_accessor :line_number

    def initialize(name = '', line_number = 1)
      @name = name
      @line_number = line_number
    end

    def name
      @name
    end

    def number
      self.class.send(:buffers).index(self) + 1
    end

    def count
      lines.size
    end
    alias length count

    def [](ix)
      lines[ix - 1].to_s
    end

    def []=(ix, line)
      lines[ix - 1] = line
    end

    def line
      lines[@line_number - 1]
    end

    def line=(line)
      lines[@line_number - 1] = line
    end

    def append(ix, line)
      lines << line
    end

    def delete(ix)
      lines.delete_at(ix - 1)
    end

    protected

      def lines
        @lines ||= ['']
      end
  end
end

