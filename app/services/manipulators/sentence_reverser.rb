class Manipulators::SentenceReverser
  def initialize(string)
    @string = string
  end

  def reverse
    word_array = split_string_into_sentences
    word_array.reverse!
    word_array.join(".")
  end

  def split_string_into_sentences
    @string.split(".")
  end

  def eng_tagger
    @eng_tagger ||= EngTagger.new
  end
end
