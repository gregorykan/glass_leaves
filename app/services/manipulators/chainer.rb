module Manipulators
  class Chainer
    def initialize(string, method_name_array)
      @string = string
      @method_name_array = method_name_array
    end

    def chain
      @method_name_array.inject(@string) { |string, method| send(method, string) }
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
  end
end