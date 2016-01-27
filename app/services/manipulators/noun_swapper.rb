module Manipulators
  class NounSwapper
    def initialize(string_a, string_b)
      @string_a = string_a
      @string_b = string_b
    end

    def swap

    end

    def split_string_into_words
      aerated = eng_tagger.get_sentences(@string)
      joined = aerated.join(" ")
      word_array = joined.split(" ")
    end

  end
end
