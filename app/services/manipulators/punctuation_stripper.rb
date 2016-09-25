class Manipulators::PunctuationStripper

  def initialize(string)
    @string = string
  end
  
  def strip
    @string.gsub(/[[:punct:]]/, '')
  end
end