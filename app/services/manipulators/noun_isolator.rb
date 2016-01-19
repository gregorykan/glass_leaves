module Manipulators
  class NounIsolator
    def initialize(string)
      @string = string
    end

    def isolate
      get_nouns.join(" ")
    end

    def get_nouns
      tagged_string = eng_tagger.add_tags(@string)
      eng_tagger.get_nouns(tagged_string).map { |k, v| k }
    end

    def eng_tagger
      @eng_tagger ||= EngTagger.new
    end
  end
end