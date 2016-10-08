module Manipulators
  class Chainer
    def initialize(string, methods_with_args)
      @string = string
      @methods_with_args = methods_with_args
    end

    def chain
      @methods_with_args.inject(@string) { |string, method_hash| send(method_hash[:method], string, *Array(method_hash[:args])) }
    end

    def swap_nouns(string_a, string_b)
      Manipulators::NounSwapper.new(string_a, string_b).swap
    end

    def replace_string(initial_string, target_string, replacement_string)
      Manipulators::StringReplacer.new(initial_string, target_string, replacement_string).replace
    end

    def replace_nouns(string, replacement_string)
      Manipulators::NounReplacer.new(string, replacement_string).replace
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
      Manipulators::WordSplicer.new(string_a, string_b).splice
    end

    def splice_sentences(string_a, string_b)
      Manipulators::SentenceSplicer.new(string_a, string_b).splice
    end

    def generate_markov_chain(string)
      Generators::MarkovChainer.new(string).generate_chain
    end

    def shuffle_nouns(string)
      Manipulators::NounShuffler.new(string).shuffle
    end

    def shuffle_verbs(string)
      Manipulators::VerbShuffler.new(string).shuffle
    end

    def strip_punctuation(string)
      Manipulators::PunctuationStripper.new(string).strip
    end

    def make_lowercase(string)
      Manipulators::Lowercasifier.new(string).lowercase
    end

    def make_uppercase(string)
      Manipulators::Uppercasifier.new(string).uppercase
    end

    def reverse_words(string)
      Manipulators::WordReverser.new(string).reverse
    end

    def reverse_sentences(string)
      Manipulators::SentenceReverser.new(string).reverse
    end

    def reverse_lines(string)
      Manipulators::LineReverser.new(string).reverse
    end
  end
end
