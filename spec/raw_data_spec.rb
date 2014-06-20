require 'spec_helper'

describe RawData do

  before do
    tables = SchemaParser.new(schema_file).parse
    @subject = RawData.new('assignments', tables['assignments'])
  end

  it 'stores the raw table name' do
    expect(@subject.name).to eq 'assignments'
  end

  it 'stores the raw content of the table' do
    content = "    t.integer \"foo\"\n    t.string  \"bar\"\n"
    expect(@subject.content).to eq content
  end
end
