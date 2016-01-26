module Manipulators
  class AdjectiveIsolator
    def initialize(string)
      @string = string
    end

    def isolate
      word_array = split_string_into_words
      adjective_array = get_adjectives
      selected_words = word_array.select { |x| adjective_array.include? x }
      selected_words.join(" ")
    end

    def get_adjectives
      tagged_string = eng_tagger.add_tags(@string)
      eng_tagger.get_adjectives(tagged_string).map { |k, v| k } + punctuation_array
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
