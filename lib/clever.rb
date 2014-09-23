require 'clever/version'
require 'clever/configuration'
require 'clever/machine_learning'
require 'clever/process'

module Clever
  attr_reader :config

  def classifiable &code
    @config ||= Clever::Configuration.new
    @config.instance_eval &code
  end

  def classify
    @config.classify
  end
end
