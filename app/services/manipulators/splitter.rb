module Manipulators
  class Splitter
    def initialize(string)
      @string = string
    end

    def split
      @string.split(/\W+/)
    end
  end
end