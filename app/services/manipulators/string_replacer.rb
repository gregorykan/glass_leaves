module Manipulators
  class StringReplacer
    def initialize(initial_string, target_string, replacement_string)
      @initial_string = initial_string
      @target_string = target_string
      @replacement_string = replacement_string
    end

    def replace
      replaced = @initial_string.gsub! @target_string, @replacement_string
      replaced.to_s
    end
  end
end
