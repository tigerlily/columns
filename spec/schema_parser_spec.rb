require 'spec_helper'

describe SchemaParser do

  describe '#parse' do
    it 'returns a hash' do
      hash = SchemaParser.new(schema_file).parse
      expect(hash).to be_an(Hash)
    end
  end

  context 'with a real schema' do
    before { @hash = SchemaParser.new(schema_file).parse }

    it 'finds the right count of tables' do
      expect(@hash.size).to eq 5
    end

    it "finds the right table's names" do
      names = ['assignments', 'products', 'users', 'users_3', 'policies']

      names.each {|name| expect(@hash).to have_key(name) }
    end

    it 'finds the content of a table in the schema' do
      expected = "    t.integer \"foo\"\n    t.string  \"bar\"\n"
      expect(@hash['assignments']).to eq expected
    end

  end

  context 'with a fake schema' do
    before do
      schema = "create_table \"foos\"\nt.integer \"foo\"\nend"
      @hash = SchemaParser.new(schema).parse
    end

    it 'finds the right count of tables' do
      expect(@hash.size).to eq 1
    end

    it "finds the right table's names" do
      expect(@hash).to have_key('foos')
    end

    it 'finds the content of a table in a fake schema' do
      expect(@hash['foos']).to eq "t.integer \"foo\"\n"
    end

  end
end
