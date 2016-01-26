module Manipulators
  class NounAndAdjectiveIsolator
    def initialize(string)
      @string = string
    end

    def isolate
      word_array = split_string_into_words
      nouns_and_adjectives_array = get_nouns_and_adjectives
      selected_words = word_array.select { |x| nouns_and_adjectives_array.include? x }
      selected_words.join(" ")
    end

    def get_nouns_and_adjectives
      tagged_string = eng_tagger.add_tags(@string)
      nouns = eng_tagger.get_nouns(tagged_string).map { |k, v| k }
      adjectives = eng_tagger.get_adjectives(tagged_string).map { |k, v| k }
      nouns + adjectives + punctuation_array
    end

    def split_string_into_words
      aerated = eng_tagger.get_sentences(@string)
      joined = aerated.join(" ")
      word_array = joined.split(" ")
    end

    def punctuation_array
      ["+",",",".","-","'","\"","&","!","?",":",";","#","~","=","/","$","£","^","(",")","_","<",">"]
    end

    def eng_tagger
      @eng_tagger ||= EngTagger.new
    end
  end
end
