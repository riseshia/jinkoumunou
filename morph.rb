# require "chasen"

module Morph
  def init_analyzer
    # Chasen::setarg("-F%m %P-\t")
  end

  def analyze(text)
    text.split(/が|に|を|だ|。/).select do |token|
      !token.nil? && !token.empty?
    end
    # Chasen::analyze(text).chomp.split(/\t/).map do |part|
    #   part.split(/ /)
    # end
  end

  def keyword?(part)
    # // =~ part
  end

  module_function :init_analyzer, :analyze, :keyword?
end