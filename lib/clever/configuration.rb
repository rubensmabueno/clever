module Clever
  class Configuration
    attr_reader :step, :machines_learning, :processes, :inputs

    def input attr
      @inputs ||= []
      @inputs << attr
    end

    def machine_learning attr
      @step ||= []
      @machines_learning ||= []

      machine_learning = eval("Clever::MachineLearning::#{attr}").new

      @machines_learning << machine_learning
      @step << machine_learning
    end

    def process attr
      @step ||= []
      @processes ||= []

      processes = eval("Clever::Process::#{attr}").new

      @processes << processes
      @step << processes
    end

    def classify
      puts @machines_learning.first.classify
    end
  end
end