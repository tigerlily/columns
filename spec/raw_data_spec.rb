require 'spec_helper'

describe RawData do

  before do
    table = Table.new(schema_file)
    @subject = RawData.new('assignments', table.content_for('assignments'))
  end

  it 'stores the raw table name' do
    expect(@subject.name).to eq 'assignments'
  end

  it 'stores the raw content of the table' do
    content = "    t.integer \"foo\"\n    t.string  \"bar\"\n"
    expect(@subject.content).to eq content
  end
end
