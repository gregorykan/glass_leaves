module Manipulators
  class Chainer
    def initialize(string, methods_with_args)
      @string = string
      @methods_with_args = methods_with_args
    end

    def chain
      @methods_with_args.inject(@string) { |string, method_hash| send(method_hash[:method], string, *Array(method_hash[:args])) }
    end

    def isolate_adjectives(string)
      Manipulators::AdjectiveIsolator.new(string).isolate
    end

    def isolate_verbs(string)
      Manipulators::VerbIsolator.new(string).isolate
    end

    def isolate_nouns(string)
      Manipulators::NounIsolator.new(string).isolate
    end

    def isolate_nouns_and_adjectives(string)
      Manipulators::NounAndAdjectiveIsolator.new(string).isolate
    end

    def strip_adjectives(string)
      Manipulators::AdjectiveStripper.new(string).strip
    end

    def strip_verbs(string)
      Manipulators::VerbStripper.new(string).strip
    end

    def strip_nouns(string)
      Manipulators::NounStripper.new(string).strip
    end

    def burn(string)
      Manipulators::Burner.new(string).burn
    end

    def randomize(string)
      Manipulators::Randomizer.new(string).randomize
    end

    def splice_words(string_a, string_b)
      puts string_a, string_b
      Manipulators::WordSplicer.new(string_a, string_b).splice
    end

    def splice_sentences(string_a, string_b)
      Manipulators::SentenceSplicer.new(string_a, string_b).splice
    end
  end
end
