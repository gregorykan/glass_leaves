module Manipulators
  class NounAndAdjectiveIsolator
    def initialize(string)
      @string = string
    end

    def isolate
      get_nouns_and_adjectives.join(" ")
    end

    def get_nouns_and_adjectives
      tagged_string = eng_tagger.add_tags(@string)
      nouns = eng_tagger.get_nouns(tagged_string).map { |k, v| k }
      adjectives = eng_tagger.get_adjectives(tagged_string).map { |k, v| k }
      nouns + adjectives
    end

    def eng_tagger
      @eng_tagger ||= EngTagger.new
    end
  end
end