module Manipulators
  class VerbStripper
    def initialize(string)
      @string = string
    end

    def strip
      word_array = split
      word_array.each do |word|
        get_verbs.each do |verb|
          if word == verb
            word_array.delete(word)
          end
        end
      end
      word_array.join(" ")
    end

    def get_verbs
      tagged_string = eng_tagger.add_tags(@string)
      base_present_verbs = eng_tagger.get_base_present_verbs(tagged_string).map { |k, v| k }
      gerund_verbs = eng_tagger.get_gerund_verbs(tagged_string).map { |k, v| k }
      infinitive_verbs = eng_tagger.get_infinitive_verbs(tagged_string).map { |k, v| k }
      past_tense_verbs = eng_tagger.get_past_tense_verbs(tagged_string).map { |k, v| k }
      present_verbs = eng_tagger.get_present_verbs(tagged_string).map { |k, v| k }
      passive_verbs = eng_tagger.get_passive_verbs(tagged_string).map { |k, v| k }
      base_present_verbs + gerund_verbs + infinitive_verbs + past_tense_verbs + present_verbs + passive_verbs
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