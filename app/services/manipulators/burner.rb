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
      aerated = eng_tagger.get_sentences(@string)
      joined = aerated.join(" ")
      word_array = joined.split(" ")
    end

    def eng_tagger
      @eng_tagger ||= EngTagger.new
    end
  end
end