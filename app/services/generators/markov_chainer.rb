module Generators
  class MarkovChainer

    def initialize(text)
      @text = text
    end

    def generate_chain
      chain_generator.get_sentences(approximate_number_of_sentences_in_text).join
    end

    def approximate_number_of_sentences_in_text
      @text.split(".").length
    end

    def chain_generator
      MarkovChains::Generator.new(@text)
    end

  end
end