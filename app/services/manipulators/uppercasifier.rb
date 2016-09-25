class Manipulators::Uppercasifier
  def initialize(string)
    @string = string
  end
  
  def uppercase
    @string.upcase
  end
end