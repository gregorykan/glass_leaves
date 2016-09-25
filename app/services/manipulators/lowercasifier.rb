class Manipulators::Lowercasifier
  def initialize(string)
    @string = string
  end
  
  def lowercase
    @string.downcase
  end
end