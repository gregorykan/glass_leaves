module Manipulators
  class NounStripper
    def initialize(string)
      @string = string
    end

    def strip
      word_array = split
      noun_array = get_nouns
      selected_words = word_array.reject { |x| noun_array.include? x }
      selected_words.join(" ")
    end

    def get_nouns
      tagged_string = eng_tagger.add_tags(@string)
      eng_tagger.get_nouns(tagged_string).map { |k, v| k }
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
