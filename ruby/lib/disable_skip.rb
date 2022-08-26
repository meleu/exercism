require 'minitest/autorun'
# You can use this to disable all skips in the current exercise by
# issuing the following command:
#   ruby -I../lib -rdisable_skip <filename_test.rb>

module Minitest
  # disables skipping in the tests
  class Test
    def skip(_msg = '', _bt = caller) = nil
  end
end
