require 'spec_helper'

describe ModelData do

  context 'with a simple singular' do
    before do
      table = Table.new(schema_file)
      raw = RawData.new('assignments', table.content_for('assignments'))
      @subject = ModelData.new(raw)
    end

    it 'provides the name of the model' do
      expect(@subject.name).to eq 'assignment'
    end

    it 'provides a «ready to paste» column names/types' do
      content = "#  integer \"foo\"\n#  string  \"bar\"\n"
      expect(@subject.content).to eq content
    end
  end

  context 'with a complex singular' do
    before do
      table = Table.new(schema_file)
      raw = RawData.new('policies', table.content_for('policies'))
      @subject = ModelData.new(raw)
    end

    it 'provides the name of the model' do
      expect(@subject.name).to eq 'policy'
    end

    it 'provides a «ready to paste» column names/types' do
      content = "#  string  \"name\"\n"
      expect(@subject.content).to eq content
    end
  end
end

