require 'spec_helper'

describe Clever do
  let(:dummy_class) { Class.new { extend Clever }  }

  describe '.classifiable' do
    it 'should respond to classifiable' do
      expect(dummy_class).to respond_to(:classifiable)
    end

    context 'when registering an input' do
      it 'should store in an array' do
        dummy_class.classifiable do
          input :foo
        end

        expect(dummy_class.config.inputs).to include :foo
      end
    end

    context 'when registering an machine_learning' do
      it 'should store in an array' do
        dummy_class.classifiable do
          machine_learning 'NeuralNetwork'
        end

        expect(dummy_class.config.machines_learning.first).to be_a Clever::MachineLearning::NeuralNetwork
      end
    end

    context 'when registering an process' do
      it 'should store in an array' do
        dummy_class.classifiable do
          process 'Binarize'
        end

        expect(dummy_class.config.processes.first).to be_a Clever::Process::Binarize
      end
    end
  end
end