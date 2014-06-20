require 'spec_helper'

describe ModelData do

  context 'with a simple singular' do
    before do
      tables = SchemaParser.new(schema_file).parse
      @subject = ModelData.new(*tables.assoc('assignments'))
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
      tables = SchemaParser.new(schema_file).parse
      @subject = ModelData.new(*tables.assoc('policies'))
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

