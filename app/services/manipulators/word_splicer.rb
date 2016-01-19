module Manipulators
  class WordSplicer
    def initialize(string_a, string_b)
      @string_a = string_a
      @string_b = string_b
    end

    def splice
      @split_string_a = Manipulators::Splitter.new(@string_a).split
      @split_string_b = Manipulators::Splitter.new(@string_b).split
      spliced = @split_string_a.zip(@split_string_b).flatten.compact
      spliced.join(" ")
    end
  end
end