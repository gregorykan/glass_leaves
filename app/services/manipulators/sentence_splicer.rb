module Manipulators
  class SentenceSplicer
    def initialize(string_a, string_b)
      @string_a = string_a
      @string_b = string_b
    end

    def splice
      @split_string_a = tagger.get_sentences(@string_a)
      @split_string_b = tagger.get_sentences(@string_b)
      spliced = @split_string_a.zip(@split_string_b).flatten.compact
      spliced.join(" ")
    end

    def tagger
      @tagger ||= EngTagger.new
    end
  end
end