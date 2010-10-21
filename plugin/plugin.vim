ruby <<
  module Vim
    def self.runtime_path(library)
      runtime_paths.detect { |path| path.include?(library) }
    end

    def self.runtime_paths
      ::VIM.evaluate('&runtimepath').split(',')
    end
  end

  $:.unshift("#{Vim.runtime_path('vim-layout')}/lib").uniq!
  require 'vim/layout.rb'
.
