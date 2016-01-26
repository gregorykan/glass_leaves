module Manipulators
  class NounReplacer
    def initialize(string, replacement_string)
      @string = string
      @replacement_string = replacement_string
    end

    def replace
      word_array = split_string_into_words
      noun_array = get_nouns
      word_array.map! do |word|
        if noun_array.include? word
          word = @replacement_string
        else
          word
        end
      end
      word_array.join(" ")
    end

    def get_nouns
      tagged_string = eng_tagger.add_tags(@string)
      eng_tagger.get_nouns(tagged_string).map { |k, v| k }
    end

    def eng_tagger
      @eng_tagger ||= EngTagger.new
    end

    def split_string_into_words
      aerated = eng_tagger.get_sentences(@string)
      joined = aerated.join(" ")
      word_array = joined.split(" ")
    end

  end
end
