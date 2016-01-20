class HomeController < ApplicationController
  def index
  end

  def manipulate
    require 'pry'; binding.pry
    # params[:operations].sort{|a, b| a[0] <=> b[0] }.map{|i| i[1] }
    # params[:operations].values
  end

  def manipulator(initial_string, method_array)
    Manipulators::Chainer.new(initial_string, method_array)
  end

end
