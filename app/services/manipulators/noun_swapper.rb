module Manipulators
  class NounSwapper
    def initialize(string_a, string_b)
      @string_a = string_a
      @string_b = string_b
    end

    def swap
      word_array = split_string_a_into_words
      string_a_noun_array = get_nouns_from_string_a
      string_b_noun_array = get_nouns_from_string_b
      word_array.map! do |word|
        if (string_a_noun_array.include? word) && (string_b_noun_array.any?)
          word = string_b_noun_array.shift
        else
          word
        end
      end
      word_array.join(" ")
    end

    def get_nouns_from_string_a
      tagged_string = eng_tagger.add_tags(@string_a)
      eng_tagger.get_nouns(tagged_string).map { |k, v| k }
    end

    def get_nouns_from_string_b
      tagged_string = eng_tagger.add_tags(@string_b)
      eng_tagger.get_nouns(tagged_string).map { |k, v| k }
    end

    def split_string_a_into_words
      aerated = eng_tagger.get_sentences(@string_a)
      joined = aerated.join(" ")
      word_array = joined.split(" ")
    end

    def eng_tagger
      @eng_tagger ||= EngTagger.new
    end
  end
end
