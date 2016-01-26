module Manipulators
  class Randomizer
    def initialize(string)
      @string = string
    end

    def randomize
      word_array = split_string_into_words
      word_array.shuffle!
      word_array.join(" ")
    end

    def split_string_into_words
      aerated = eng_tagger.get_sentences(@string)
      joined = aerated.join(" ")
      word_array = joined.split(" ")
    end

    def eng_tagger
      @eng_tagger ||= EngTagger.new
    end
  end
end
