require 'rails_helper'
require 'stock_sales/input_file_reader'


describe StockSales::InputFileReader do
  let(:sample_input) { described_class.new('spec/fixtures/sample_input_file.csv') }

  describe '.new' do
    it 'accepts a filename' do
      expect {described_class.new('spec/fixtures/sample_input_file.csv')}.to_not raise_error
    end

    it 'raises an error if the file does not exist' do
      expect {described_class.new('file_that_does_not_exist.csv')}.to raise_error
    end

    it 'raises an error if the file is not a csv' do
      expect {described_class.new('spec/fixtures/sample_input_file.txt')}.to raise_error
    end
  end

  describe '#headers' do
    it 'returns an array of csv headers' do
      sample_input = described_class.new('spec/fixtures/sample_input_file.csv')
      expect(sample_input.headers).to eq ['Column 1', 'Column 2', 'Column 3']      
    end
  end

  describe '#clean_row' do
    it 'returns an array of cells from a string representing a row' do
      row = "a\tb\tc\n"
      expect(sample_input.clean_row(row)).to eq ["a", "b", "c"]
    end
  end

  describe '#valid_row?' do

    it 'raises an error when a cell is blank' do
      row = ["b", "a"]
      expect {sample_input.valid_row?(row)}.to raise_error(RuntimeError)
    end

    it 'returns true when no cells are blank' do
      row = ["a", "b", "c"]
      expect(sample_input.valid_row?(row)).to be true
    end
  end

  describe '#generate_hash' do
    it 'returns a hash with keys matching the headers declared in @fields' do
      row = "a\tb\tc\n"
      expect(described_class.new("spec/fixtures/sample_input_with_correct_headers.csv").generate_hash(row).keys).to eq ["id", "desc"]
    end

    it 'returns a hash with only the values matching keys declared in @fields' do
      row = "a\tb\tc\n"
      expect(described_class.new("spec/fixtures/sample_input_with_correct_headers.csv").generate_hash(row).values).to eq ["b", "c"]
      expect(sample_input.generate_hash(row).values).to eq []
    end    
  end
end
