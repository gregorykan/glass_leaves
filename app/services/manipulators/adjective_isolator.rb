module Manipulators
  class AdjectiveIsolator
    def initialize(string)
      @string = string
    end

    def isolate
      get_adjectives.join(" ")
    end

    def get_adjectives
      tagged_string = eng_tagger.add_tags(@string)
      eng_tagger.get_adjectives(tagged_string).map { |k, v| k }
    end

    def eng_tagger
      @eng_tagger ||= EngTagger.new
    end
  end
end