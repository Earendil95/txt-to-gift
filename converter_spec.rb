require "./converter.rb"

describe Converter do
  describe 'convert' do
    it "result should be equally to expected result" do
      input_name = "./test_input.txt"
      result_name = "./real_result.txt"
      expected_result_name = "./expected_result.txt"
      input = File.open(input_name, "r")
      result = File.open(result_name, "w")
      expected_result = File.open(expected_result_name, "r")
      Converter.convert(input, result)
      result.close
      result = File.open(result_name)
      expect(File.read(result_name)).to eq File.read(expected_result_name)
    end
  end
end