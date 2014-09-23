require 'spec_helper'

describe Clever::Configuration do
  let(:dummy_class) { Class.new { extend Clever }  }

  describe '.classify' do
    context 'on a given machine_learning' do
      before do
        dummy_class.classifiable do
          machine_learning 'NeuralNetwork'
        end
      end

      it 'should call classify' do
        dummy_class.classify
        expect_any_instance_of(Clever::MachineLearning::NeuralNetwork).to receive(:classify)
      end
    end
  end
end