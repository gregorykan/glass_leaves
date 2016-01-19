module Manipulators
  class Randomizer
    def initialize(string)
      @string = string
    end

    def randomize
      word_array = split
      word_array.shuffle!
    end

    def split
      splitter(@string).split
    end

    def splitter(string)
      @splitter ||= Manipulators::Splitter.new(string)
    end
  end
end