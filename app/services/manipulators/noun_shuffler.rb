module Manipulators
  class NounShuffler
    def initialize(string)
      @string = string
    end

    def shuffle
      word_array = split_string_into_words
      noun_array = get_nouns_from_string
      noun_instances_array = get_all_noun_instances_including_repetitions(noun_array, word_array)
      shuffled_nouns = noun_instances_array.dup.shuffle
      word_array.map! do |word|
        if (noun_array.include? word)
          word = shuffled_nouns.pop
        else
          word
        end
      end
      word_array.join(" ")
    end

    def get_all_noun_instances_including_repetitions(noun_array, word_array)
      all_noun_instances = []
      word_array.map do |word|
        if (noun_array.include? word)
          all_noun_instances.push(word)
        end
      end
      all_noun_instances
    end

    def get_nouns_from_string
      tagged_string = eng_tagger.add_tags(@string)
      eng_tagger.get_nouns(tagged_string).map { |k, v| k }
    end

    def split_string_into_words
      aerated = eng_tagger.get_sentences(@string)
      joined = aerated.join(" ")
      word_array = joined.split(" ")
    end

    def eng_tagger
      @eng_tagger ||= EngTagger.new
    end
  end
end
