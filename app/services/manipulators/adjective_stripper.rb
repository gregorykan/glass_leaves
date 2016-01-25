module Manipulators
  class AdjectiveStripper
    def initialize(string)
      @string = string
    end

    def strip
      word_array = split
      adjective_array = get_adjectives
      selected_words = word_array.reject { |x| adjective_array.include? x }
      selected_words.join(" ")
    end

    def get_adjectives
      tagged_string = eng_tagger.add_tags(@string)
      eng_tagger.get_adjectives(tagged_string).map { |k, v| k }
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
