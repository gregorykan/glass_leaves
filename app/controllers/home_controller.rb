class HomeController < ApplicationController
  def index
    @procedures ||= procedures
  end

  def manipulate
    method_array = params[:operations].values.map { |x| args = [] if x["args"].empty?; args = x["args"] if x["args"].present?; {method: method_id_to_name_hash[x["name"]], args: args} }
    initial_string = params[:initial_text]
    @manipulated = manipulator(initial_string, method_array).chain
    render 'home/manipulated'
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

  def procedures
    [['Burn', 1],
    ['Randomize', 2],
    ['Get Nouns', 3],
    ['Get Nouns and Adjectives', 4],
    ['Get Adjectives', 5],
    ['Get Verbs', 6],
    ['Remove Nouns', 7],
    ['Remove Adjectives', 8],
    ['Remove Verbs', 9],
    ['Splice Words', 10],
    ['Splice Sentences', 11]]
  end

end
