module Manipulators
  class Burner
    def initialize(string)
      @string = string
    end

    def burn
      word_array = split
      random_number = rand(word_array.length)
      words_to_burn = word_array.sample(random_number)
      burnt_array = word_array - words_to_burn
      burnt_array.join(" ")
    end

    def split
      splitter(@string).split
    end

    def splitter(string)
      @splitter ||= Manipulators::Splitter.new(string)
    end

  end
end