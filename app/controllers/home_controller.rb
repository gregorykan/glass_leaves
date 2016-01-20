class HomeController < ApplicationController
  def index
  end

  def manipulate
    method_array = params[:operations].values.map { |x| {method: method_id_to_name_hash[x["name"]], args: x["args"]} }
    initial_string = params[:initial_text]
    binding.pry
  end

  def manipulator(initial_string, method_array)
    Manipulators::Chainer.new(initial_string, method_array)
  end

  def method_id_to_name_hash
    {
      "1" => "burn",
      "2" => "randomize",
      "3" => "isolate_nouns",
      "4" => "isolate_nouns_and_adjectives",
      "5" => "isolate_adjectives",
      "6" => "isolate_verbs",
      "7" => "strip_nouns",
      "8" => "strip_adjectives",
      "9" => "strip_verbs",
      "10" => "splice_words",
      "11" => "splice_sentences"
    }
  end

end
