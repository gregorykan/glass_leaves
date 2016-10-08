class Manipulators::LineReverser
  def initialize(string)
    @string = string
  end

  def reverse
    word_array = split_string_into_lines
    word_array.reverse!
    word_array.join("\r\n")
  end

  def split_string_into_lines
    @string.split("\r\n")
  end

  def eng_tagger
    @eng_tagger ||= EngTagger.new
  end
end
