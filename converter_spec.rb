require './converter.rb'

describe Converter do
  describe 'convert' do
    it 'result should be equally to expected result without RegExp parameters' do
      input_name = './spec_examples/test_input1.txt'
      result_name = './spec_examples/real_result1.txt'
      expected_result_name = './spec_examples/expected_result1.txt'
      input = File.open(input_name, 'r')
      result = File.open(result_name, 'w')
      expected_result = File.open(expected_result_name, 'r')
      Converter.convert(input, result)
      result.close
      result = File.open(result_name)
      expect(File.read(result_name)).to eq File.read(expected_result_name)
    end

    it 'result should be equally to expected result with RegExp parameters' do
      input_name = './spec_examples/test_input2.txt'
      result_name = './spec_examples/real_result2.txt'
      expected_result_name = './spec_examples/expected_result2.txt'
      input = File.open(input_name, 'r')
      result = File.open(result_name, 'w')
      expected_result = File.open(expected_result_name, 'r')
      Converter.convert(input, result, '\d+\.', '\d+\)', '(\+?)')
      result.close
      result = File.open(result_name)
      expect(File.read(result_name)).to eq File.read(expected_result_name)
    end
  end
end
