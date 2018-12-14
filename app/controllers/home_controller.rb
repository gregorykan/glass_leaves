class HomeController < ApplicationController

  def index
    @procedures ||= procedures.sort!
    @user_texts ||= user_texts
  end

  def about
  end

  def manipulate
    @procedures ||= procedures.sort!
    @user_texts ||= user_texts
    if params[:operations].present?
      @initial_string = params[:initial_text]
      @manipulated = manipulator(@initial_string, method_array(params)).chain
      manipulations = method_array(params).map { |x| x[:method] }.join(", ")
      Event.create!(event_type: "Manipulation", comment: manipulations)
      render 'home/index'
    elsif params[:download].present?
      timestamp = DateTime.now.to_formatted_s(:short).gsub(':', '').gsub(/\s+/, '')
      send_data params[:initial_text], :disposition => 'attachment', :filename => "manipulation-#{timestamp}.txt"
      Event.create!(event_type: "Download", comment: "download")
      return
    elsif params[:save_text].present?
      @manipulated = params[:initial_text]
      timestamp = DateTime.now.to_formatted_s(:short)
      name = "Manipulation #{timestamp}"
      Text.create!(name: name, content: params[:initial_text], user_id: current_user.id)
      flash[:notice] = "Successfully saved '#{name}' to My Texts"
      render 'home/index'
    else
      @manipulated = params[:initial_text]
      flash[:notice] = "Looks like you didn't Add a Manipulation. Click the 'Add Manipulation' button once you've made your selection(s)."
      render 'home/index'
    end
  end

  def user_texts
    if current_user
      Text.where(user_id: current_user.id).order(created_at: :desc).map { |x| [x.name, x.content] }
    else
      []
    end
  end

  def method_array(params)
    method_array = params[:operations].values.map do |x|
      if x["args"].values == [""]
        args = []
      elsif x["args"].present?
        args = x["args"].values
      else
        args = []
      end
      { method: method_id_to_name_hash[x["name"]],
        args: args }
    end
  end

  def operations
    params[:operations].values.map{|operation| operation.merge args: operation[:args].values }
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
      "11" => "splice_sentences",
      "12" => "replace_string",
      "13" => "replace_nouns",
      "14" => "swap_nouns",
      "15" => "generate_markov_chain",
      "16" => "shuffle_nouns",
      "17" => "shuffle_verbs",
      "18" => "strip_punctuation",
      "19" => "make_lowercase",
      "20" => "make_uppercase",
      "21" => "reverse_words",
      "22" => "reverse_sentences",
      "23" => "reverse_lines"
    }
  end

  def procedures
    [
      ['Burn', 1],
      ['Randomize', 2],
      ['Get Nouns', 3],
      ['Get Nouns and Adjectives', 4],
      ['Get Adjectives', 5],
      ['Get Verbs', 6],
      ['Remove Nouns', 7],
      ['Remove Adjectives', 8],
      ['Remove Verbs', 9],
      ['Splice Words', 10],
      ['Splice Sentences', 11],
      ['Replace X with Y', 12],
      ['Replace Nouns with X', 13],
      ['Swap Nouns', 14],
      ['Generate Markov Chain', 15],
      ['Shuffle Nouns', 16],
      ['Shuffle Verbs', 17],
      ['Strip Punctuation', 18],
      ['Lowercasify', 19],
      ['Uppercasify', 20],
      ['Reverse Words', 21],
      ['Reverse Sentences', 22],
      ['Reverse Lines', 23]
    ]
  end

end
