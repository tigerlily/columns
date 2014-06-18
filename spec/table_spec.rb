require 'spec_helper'

describe Table do

  before { @table = Table.new(schema_file) }

  it 'find the right count of tables in the schema' do
    expect(@table.names.size).to eq 5
  end

  it 'find the right count of tables in a fake schema' do
    schema = "create_table \"foos\"\nt.integer \"foo\"\nend"
    expect(Table.new(schema).names.size).to eq 1
  end

  it "find the right table's names in the schema" do
    names = ['assignments', 'products', 'users', 'users_3', 'policies']
    @table.names.each do |name|
      expect(names.include?(name)).to be true
    end
  end

  it "find the right table's names in a fake schema" do
    schema = "create_table \"foos\"\nt.integer \"foo\"\nend"
    expect(Table.new(schema).names.first).to eq 'foos'
  end

  it 'find the content of a table in a fake schema' do
    schema = "create_table \"foos\"\nt.integer \"foo\"\nend"
    content = Table.new(schema).content_for('foos')
    expect(content).to eq "t.integer \"foo\"\n"
  end

  it 'find the content of a table in the schema' do
    content = @table.content_for('assignments')
    expected = "    t.integer \"foo\"\n    t.string  \"bar\"\n"
    expect(content).to eq expected
  end
end

