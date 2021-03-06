# VIM::Window objects represent vim windows.
#
# Class Methods:
#
# current		    Returns the current window object.
# count		      Returns the number of windows.
# self[{n}]	    Returns the window object for the number {n}.  The first number is 0.
#
# Methods:
#
# buffer		    Returns the buffer displayed in the window.
# height		    Returns the height of the window.
# height = {n}	Sets the window height to {n}.
# width		      Returns the width of the window.
# width = {n}	  Sets the window width to {n}.
# cursor		    Returns a [row, col] array for the cursor position.
# cursor = [{row}, {col}] Sets the cursor position to {row} and {col}.

module Mocks
  class Window
    class << self
      attr_accessor :current_ix

      def [](ix)
        windows[ix]
      end

      def current
        windows[current_ix]
      end

      def count
        windows.size
      end

      # internal

        def reset
          @current_ix = 0
          @@windows = nil
        end

        def current_ix
          @current_ix ||= 0
        end

        def current_ix=(ix)
          @current_ix = ix
          $curwin = current
        end

        def windows
          @@windows ||= [Window.new]
        end
    end

    attr_reader :buffer
    attr_accessor :height, :width, :cursor

    def initialize(path = nil)
      @buffer = Buffer.new(path)
      @cursor = [1, 1]
      @width  = 300
      @height = 80

      @@windows ||= []
      @@windows << self
    end

    def cursor=(point)
      @cursor = point
      buffer.line_number = point.first
    end
  end
end

