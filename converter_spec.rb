require './converter'

def file_path(name)
  "#{File.dirname(__FILE__)}/fixtures/#{name}.txt"
end

describe Converter do
  describe 'convert' do
    let(:options) { {} }

    before do
      Converter.convert(input, result, options)
    end

    context "default" do
      let(:input) { File.open(file_path "test_input1") }
      let(:result) { File.open(file_path("real_result1"), "w") }
      let(:expected) { File.read(file_path "expected_result1") }
      subject { File.read(file_path "real_result1") }

      it { expect(subject).to eq expected }
    end

    context "with RegExp options" do
      let(:input) { File.open(file_path "test_input2") }
      let(:result) { File.open(file_path("real_result2"), "w") }
      let(:expected) { File.read(file_path "expected_result2") }
      let(:options) do
        { question_prefix: '^\s*\d+\.',
          option_prefix: '^\s*\d+\)',
          option_correct: '(\+?)' }
      end
      subject { File.read(file_path "real_result2") }

      it { expect(subject).to eq expected }
    end

    context "with answer file" do
      let(:input) { File.open(file_path "test_input3") }
      let(:result) { File.open(file_path("real_result3"), "w") }
      let(:expected) { File.read(file_path "expected_result1") }
      let(:options) { { answers: file_path("answers") } }
      subject { File.read(file_path "real_result3") }

      it { expect(subject).to eq expected }
    end
  end
end
